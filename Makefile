remote := aur

upstream := https://github.com/home-assistant/core.git
update_check = git ls-remote --tags --refs $(upstream) | grep -Po '.*refs/tags/\K\d{4}\.\d+\.\d+$$' | sort -V | tail -n1
VERSION = $(shell cat .version 2>/dev/null)

QUILT_DIR = $(CURDIR)/src/core-$(VERSION)
QUILT_PC = $(QUILT_DIR)/.pc
QUILT = QUILT_PATCHES=$(CURDIR) \
	QUILT_DIFF_OPTS="--show-c-function" \
	QUILT_DIFF_ARGS="--no-timestamps --no-index -p ab" \
	QUILT_REFRESH_ARGS="--no-timestamps --no-index -p ab" \
	quilt --quiltrc -

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
	makepkg -o --noprepare

patch-init: src/core-$(VERSION)
	mkdir -p $(QUILT_PC)
	echo 2 > $(QUILT_PC)/.version
	echo "$(CURDIR)" > $(QUILT_PC)/.quilt_patches
	echo "series" > $(QUILT_PC)/.quilt_series
	ls -1 *.patch 2>/dev/null > $(QUILT_PC)/series || true
	cd $(QUILT_DIR) && $(QUILT) push -a --fuzz=3

patch-export:
	cd $(QUILT_DIR) && for p in $$($(QUILT) applied 2>/dev/null); do \
	  $(QUILT) refresh "$$p"; \
	done
	$(MAKE) PKGBUILD

# vim: set noexpandtab:
