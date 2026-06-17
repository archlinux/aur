remote := aur

upstream := https://github.com/home-assistant/core.git
update_check = git ls-remote --tags --refs $(upstream) | grep -Po '.*refs/tags/\K\d{4}\.\d+\.\d+$$' | sort -V | tail -n1
VERSION = $(shell cat .version 2>/dev/null)

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
update_version: CURRENT_VERSION = $(VERSION)
update_version:
	@if [ "$(NEW_VERSION)" != "$(CURRENT_VERSION)" ]; then \
	  echo "$(NEW_VERSION)" > .version; \
	  echo "New version: $(NEW_VERSION)"; \
	fi

src/core-$(VERSION):
	makepkg -o --noprepare --skipinteg

STG_ENV = GIT_DIR=../stg GIT_WORK_TREE=.

src/stg: src/core-$(VERSION)
	rm -rf $@
	cd src/core-$(VERSION) && \
	$(STG_ENV) git init && \
	$(STG_ENV) git add -A && \
	$(STG_ENV) git commit -m "upstream" && \
	$(STG_ENV) stg init && \
	for patch in ../../*.patch; do \
	  if [ -f "$$patch" ]; then \
	    name=$${patch##*/} && name=$${name%.patch} && \
	      $(STG_ENV) stg import -n "$$name" -p1 "$$patch"; \
	  fi \
	done

patch-init: src/stg

patch-export:
	rm -f *.patch
	cd src/core-$(VERSION) && $(STG_ENV) stg export --patch -t ../../patchexport.tmpl --dir ../../
	$(MAKE) PKGBUILD

# vim: set noexpandtab:


