.PHONY: upload version

remote = github
repo = https://github.com/kellerza/pysma
branch = master

.SRCINFO: PKGBUILD
	mksrcinfo

PKGBUILD: version

version: FORCE
	git remote show | grep github || git remote add $(remote) $(repo)
	git fetch $(remote)
	git describe --tags $(remote)/$(branch) | cut -d- -f1 > $@

FORCE:
	

%: %.in
	m4 $< > $*

upload: .SRCINFO
	git commit -am "`cat version`"
	git push
