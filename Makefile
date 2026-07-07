remote := aur

upstream := https://github.com/home-assistant/core.git
update_check = git ls-remote --tags --refs $(upstream) | grep -Po '.*refs/tags/\K\d{4}\.\d+\.\d+$$' | sort -V | tail -n1
VERSION = $(shell cat .version 2>/dev/null)

STG_ENV = GIT_DIR=$(CURDIR)/src/stg GIT_WORK_TREE=$(CURDIR)/src/core-$(VERSION)

.PHONY: upload commit update_version patch-init patch-export

default: update_version .SRCINFO

upload: commit
	git push $(remote)

commit: .SRCINFO
	git commit -am "$(VERSION)"

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > $@

PKGBUILD: PKGBUILD.in .version $(wildcard *.patch)
	m4 $< > $@
	updpkgsums $@

update_version: NEW_VERSION = $(shell $(update_check))
update_version:
	@if [ "$(NEW_VERSION)" != "$(VERSION)" ]; then \
	  echo "$(NEW_VERSION)" > .version; \
	  echo "New version: $(NEW_VERSION)"; \
	fi

src/core-$(VERSION):
	makepkg -o --noprepare --skipinteg

src/stg: src/core-$(VERSION)
	$(STG_ENV) git init && \
	$(STG_ENV) git add -A && \
	$(STG_ENV) git commit -m "upstream" && \
	$(STG_ENV) stg init && \
	for patch in *.patch; do \
	  $(STG_ENV) stg import -n "$${patch%.patch}" -p1 "$$patch"; \
	done

patch-init: src/stg

patch-export:
	rm -f *.patch
	$(STG_ENV) stg export --patch -t patchexport.tmpl --dir .
	$(MAKE) PKGBUILD

# vim: set noexpandtab:
