branch_local := main
branch_remote := master
remote := aur

upstream := https://github.com/sakowicz/actual-ai
version_regexp := .*
update_check = git ls-remote --tags --refs $(upstream) | grep -Po '.*refs/tags/\K$(version_regexp)' | sort -V | tail -n1

.PHONY: upload commit update_version

default: .version PKGBUILD .SRCINFO

upload: commit
	git push $(remote) $(branch_local):$(branch_remote)

commit: VERSION = $(shell cat .version)
commit: .SRCINFO
	git commit -am "$(VERSION)"

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > $@

PKGBUILD: PKGBUILD.in .version
	m4 -DVERSION=$(shell cat .version) $< > $@
	updpkgsums $@

.version: NEW_VERSION = $(shell $(update_check))
.version: CURRENT_VERSION = $(shell cat .version 2>/dev/null)
.version:
	@if [ "$(NEW_VERSION)" != "$(CURRENT_VERSION)" ]; then \
	  echo "$(NEW_VERSION)" > .version; \
	  echo "New version: $(NEW_VERSION)"; \
	fi

update_version: .version

# vim: set noexpandtab:
