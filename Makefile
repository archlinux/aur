.PHONY: upload

remote = github
repo = https://github.com/XKNX/xknx.git
branch = main

version: FORCE
	git remote show $(remote) || git remote add $(remote) $(repo)
	git fetch $(remote)
	git describe --tags $(remote)/$(branch) | cut -d- -f1 > $@

FORCE:
	

PKGBUILD: version

%: %.in
	m4 $< > $*

.SRCINFO: PKGBUILD
	mksrcinfo

upload: .SRCINFO
	git commit -am "`cat version`"
	git push
