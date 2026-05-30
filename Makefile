# Maintenance helpers for the ruroco-client-ui AUR package.
#
# Cut a new release (after the upstream GitHub tag exists):
#   make release VERSION=0.14.2   # bump + checksums + .SRCINFO + build + commit
#   make push                     # push the commit to the AUR (review first!)
#
# One-off:
#   make keywords                 # set AUR search keywords

PKG      := ruroco-client-ui
KEYWORDS := port-knocking single-packet-authorization fwknop udp remote-command firewall ssh rust gui

.PHONY: help release push bump checksums srcinfo build lint commit keywords clean

help:
	@echo '$(PKG) AUR maintenance targets:'
	@echo '  release VERSION=x.y.z  bump + checksums + .SRCINFO + build + commit (no push)'
	@echo '  push                   push the committed change to the AUR'
	@echo '  keywords               set AUR search keywords ($(KEYWORDS))'
	@echo '  bump VERSION=x.y.z     set pkgver=x.y.z and pkgrel=1 in PKGBUILD'
	@echo '  checksums              refresh source sha256sums (updpkgsums)'
	@echo '  srcinfo                regenerate .SRCINFO from PKGBUILD'
	@echo '  build                  sanity build (makepkg -f)'
	@echo '  lint                   run namcap on the PKGBUILD'
	@echo '  clean                  remove build artifacts (src/ pkg/ *.pkg.tar.zst)'

# Full local release prep. Order enforced via recursive make (safe under -j).
# Stops before pushing so you can review the commit.
LATEST_VERSION  = $(shell curl -fsSL https://api.github.com/repos/beac0n/ruroco/releases/latest | grep '"tag_name"' | sed 's/.*"v\([^"]*\)".*/\1/')
CURRENT_VERSION = $(shell grep '^pkgver=' PKGBUILD | cut -d= -f2)

release:
	$(eval VERSION ?= $(LATEST_VERSION))
	@test -n "$(VERSION)" || { echo 'error: VERSION not specified and could not fetch latest from GitHub'; exit 1; }
	@test "$(VERSION)" != "$(CURRENT_VERSION)" || { echo 'error: $(VERSION) is already the current pkgver'; exit 1; }
	$(MAKE) bump VERSION='$(VERSION)'
	$(MAKE) checksums
	$(MAKE) srcinfo
	$(MAKE) build
	$(MAKE) commit VERSION='$(VERSION)'
	@echo
	@echo '==> $(PKG) $(VERSION)-1 prepared and committed. Review it, then run: make push'

push:
	git push

bump:
	@test -n "$(VERSION)" || { echo 'error: VERSION required, e.g. make bump VERSION=0.14.2'; exit 1; }
	sed -i 's/^pkgver=.*/pkgver=$(VERSION)/' PKGBUILD
	sed -i 's/^pkgrel=.*/pkgrel=1/' PKGBUILD

checksums:
	updpkgsums

# .SRCINFO is mandatory on the AUR and must always match the PKGBUILD.
srcinfo:
	makepkg --printsrcinfo > .SRCINFO

build:
	makepkg -f

lint:
	namcap PKGBUILD

commit:
	@test -n "$(VERSION)" || { echo 'error: VERSION required, e.g. make commit VERSION=0.14.2'; exit 1; }
	git commit -am '$(PKG) $(VERSION)-1'

keywords:
	ssh aur@aur.archlinux.org set-keywords $(PKG) $(KEYWORDS)

clean:
	rm -rf src pkg
	rm -f *.pkg.tar.zst *.tar.gz *.log
