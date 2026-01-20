branch_local := master
branch_remote := master
remote := origin

upstream := https://github.com/bareos/bareos.git
version_regexp := Release/\K[0-9.]+
update_check = git ls-remote --tags --refs $(upstream) | grep -Po '.*refs/tags/\K$(version_regexp)' | sort -V | tail -n1

.PHONY: upload commit update_version

default: update_version .SRCINFO

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

update_version: NEW_VERSION = $(shell $(update_check))
update_version: CURRENT_VERSION = $(shell cat .version 2>/dev/null)
update_version:
	@if [ "$(NEW_VERSION)" != "$(CURRENT_VERSION)" ]; then \
	  printf "%s" "$(NEW_VERSION)" > .version; \
	  echo "New version: $(NEW_VERSION)"; \
	fi

# vim: set noexpandtab:
