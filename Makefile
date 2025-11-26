branch_local := main
branch_remote := master
remote := aur
upstream := https://github.com/go-vikunja/vikunja

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

update_version: NEW_VERSION = $(shell \
  git ls-remote --tags --refs "$(upstream)" 'v*.*' | \
    grep -Po '.*refs/tags/v\K.*' | sort -V | tail -n1 \
)
update_version: CURRENT_VERSION = $(shell cat .version 2>/dev/null)
update_version:
	@if [ "$(NEW_VERSION)" != "$(CURRENT_VERSION)" ]; then \
	  echo "$(NEW_VERSION)" > .version; \
	  echo "New version: $(NEW_VERSION)"; \
	fi

# vim: set noexpandtab:
