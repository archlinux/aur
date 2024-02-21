.PHONY: upload

remote = github
repo = https://github.com/home-assistant/frontend
branch = master

all: .SRCINFO

fetch:
	git remote show | grep github || git remote add $(remote) $(repo)
	git fetch $(remote)

version: VERSION = "$(shell git describe --tags $(remote)/$(branch) | cut -d- -f1)"
version: fetch
	echo $(VERSION) > $@
	touch -d "$(shell git show -s --format=%ci $(VERSION))" $@

PKGBUILD: version
%: %.in
	m4 $< > $*

.SRCINFO: PKGBUILD
	mksrcinfo

commit: .SRCINFO version
	git diff --exit-code > /dev/null || git commit -am "`cat version`"

upload: commit
	git push
