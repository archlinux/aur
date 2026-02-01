# Makefile for updating package from github tagged versions
# Author: Fernando Carmona Varo <ferkiwi @t gmail dot com>

# 1. Try to get version from CLI (make update VERSION=1.2.3)
# 2. If not provided, fetch the latest tag from GitHub
ifeq ($(VERSION),)
    # Extract owner/repo from the URL line in PKGBUILD
    REPO_URL := $(shell grep -oP 'url="https://github.com/\K[^/]+/[^/"]+' PKGBUILD)
    VERSION  := $(shell curl -s "https://api.github.com/repos/$(REPO_URL)/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
endif

.PHONY: update update-srcinfo update-pkgbuild update-version update-sums build clean

update: update-pkgbuild update-srcinfo

update-pkgbuild: update-version update-sums

update-version:
	@if [ -z "$(VERSION)" ]; then echo "Error: Could not fetch version."; exit 1; fi
	@echo "Targeting version: $(VERSION)"
	@# Remove 'v' prefix if GitHub uses it (e.g., v1.0.0 -> 1.0.0)
	$(eval CLEAN_VER := $(shell echo $(VERSION) | sed 's/^v//'))
	@sed -i 's/^pkgver=.*/pkgver=$(CLEAN_VER)/' PKGBUILD
	@sed -i 's/^pkgrel=.*/pkgrel=1/' PKGBUILD

update-sums:
	@echo "Updating checksums for $(VERSION)..."
	@NEW_SUMS=$$(makepkg -g 2>/dev/null); \
	sed -i "s/^sha256sums=.*/$$NEW_SUMS/" PKGBUILD

update-srcinfo:
	@echo "Updating .SRCINFO"
	@makepkg --printsrcinfo > .SRCINFO

build:
	@makepkg -sfc

clean:
	@rm -rf pkg/ src/ *.tar.gz *.tar.xz *.pkg.tar.zst

