build : SML.docset.tgz

SML.docset.tgz : SML.docset
	docker run --rm -it -v "$$(pwd)":/here -w /here ubuntu tar --exclude='.DS_Store' -cvzf "$@" "$<"

SML.docset : out
	rm -rf "$@"
	dashing build --source "$<"

out : basis prepare
	rm -rf "$@"
	./prepare

basis :
	rm -rf "$@"
	svn export https://github.com/SMLFamily/SMLFamily.github.io.git/trunk/Basis "$@"

clean:
	rm -rf SML.docset.tgz SML.docset out basis
