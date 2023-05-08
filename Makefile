.PHONY: upload version

upstream_remote = github
upstream_repo = https://github.com/rohankapoorcom/zm-py
upstream_branch = master

aur_remote = aur
aur_repo = aur@aur.archlinux.org:python-zm-py
aur_branch = master

.SRCINFO: PKGBUILD
	mksrcinfo

PKGBUILD: version

version: FORCE
	git remote show $(upstream_remote) >& /dev/null || git remote add $(upstream_remote) $(upstream_repo)
	git fetch $(upstream_remote)
	git describe --tags $(upstream_remote)/$(upstream_branch) | cut -d- -f1 > $@

FORCE:
	

%: %.in
	m4 $< > $*

upload: .SRCINFO PKGBUILD
	git remote show $(aur_remote) >& /dev/null || git remote add $(aur_remote) $(aur_repo)
	git commit -am "`cat version`"
	git push $(aur_remote) HEAD:$(aur_branch)
