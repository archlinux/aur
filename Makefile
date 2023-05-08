.PHONY: upload

remote = github
repo = https://github.com/home-assistant/frontend
branch = master

version:
	git remote show | grep github || git remote add $(remote) $(repo)
	git fetch $(remote)
	git describe --tags $(remote)/$(branch) | cut -d- -f1 > $@

PKGBUILD: version

%: %.in
	m4 $< > $*

.SRCINFO: PKGBUILD
	mksrcinfo

upload: .SRCINFO
	git commit -am "`cat version`"
	git push
