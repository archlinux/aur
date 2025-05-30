SHELL := /bin/bash
PKGNAME := $(shell awk -F= '/^pkgname=/ {print $$2}' PKGBUILD)
PKGVER := $(shell awk -F= '/^pkgver=/ {print $$2}' PKGBUILD)
PKGREL := $(shell awk -F= '/^pkgrel=/ {print $$2}' PKGBUILD)
PKGFILE := $(PKGNAME)-$(PKGVER)-$(PKGREL)-x86_64.pkg.tar.zst
PKGURL := https://github.com/Azure/azure-storage-fuse/archive/refs/tags/blobfuse2-$(PKGVER).tar.gz
CHECKSUM = $(shell uv run https -qd "$(PKGURL)" | sha256sum - | cut -d" " -f1)

export LANG = C

#-------------------------------------------------------------------------------
# HELPERS
#-------------------------------------------------------------------------------

.PHONY: all
all: clean check-updates take-updates checksum $(PKGFILE)

.PHONY: checksum
checksum:
	@sed -i -r -e "s/^sha256sums=.*/sha256sums=('$(CHECKSUM)')/g" PKGBUILD
	@grep -E "^sha256sums=" PKGBUILD

.PHONY: clean
clean:
	git clean -fdX

.PHONY: dist-clean
dist-clean: clean

.PHONY: check-updates
check-updates:
	@uv run nvchecker -c .nvchecker.toml
	@uv run nvcmp -c .nvchecker.toml

.PHONY: take-updates
take-updates:
	@uv run nvtake -c .nvchecker.toml azure-storage-fuse
	@sed -i -r -e "s/^pkgver=[0-9.]+\$$/pkgver=$(shell jq -r '.data."azure-storage-fuse".version' < .nvchecker.next.json)/g" PKGBUILD
	@sed -i -r -e "s/^version = \"[0-9.]+\"\$$/version = \"$(shell jq -r '.data."azure-storage-fuse".version' < .nvchecker.next.json)\"/g" pyproject.toml

.PHONY: build
build: $(PKGFILE)

#-------------------------------------------------------------------------------
# FILES
#-------------------------------------------------------------------------------

$(PKGFILE):
	makepkg -s
	makepkg --printsrcinfo > .SRCINFO
