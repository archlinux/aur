remote := aur

upstream := https://github.com/home-assistant/core.git
update_check = git ls-remote --tags --refs $(upstream) | grep -Po '.*refs/tags/\K\d{4}\.\d+\.\d+$$' | sort -V | tail -n1

.PHONY: upload commit update_version

default: update_version .SRCINFO

upload: commit
	git push $(remote)

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
	  echo "$(NEW_VERSION)" > .version; \
	  echo "New version: $(NEW_VERSION)"; \
	fi

# vim: set noexpandtab:


