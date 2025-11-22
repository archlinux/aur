branch_local := main
branch_remote := master
remote := aur

.PHONY: upload commit

default: .SRCINFO

upload: commit
	git push $(remote) $(branch_local):$(branch_remote)

commit: VERSION = $(shell cat .version)
commit: .SRCINFO
	git commit -am "$(VERSION)"

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > $@

PKGBUILD: PKGBUILD.in .version
	m4 $< > $@
	updpkgsums $@

.version: FORCE
	nvchecker -c .nvchecker.toml --logger json | jq -r 'select(has("version")).version' > $@

FORCE:
