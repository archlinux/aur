PKGNAME  := wltile
REPO     := kdehairy/wltile
PKGBUILD := PKGBUILD
SRCINFO  := .SRCINFO
BUILDDIR := build

API := https://api.github.com/repos/$(REPO)/releases/latest

.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
SHELL := /bin/bash

.PHONY: check update verify clean

check:
	@current=$$(sed -n 's/^pkgver=//p' $(PKGBUILD))
	latest=$$(curl -sSf $(API) | jq -r '.tag_name' | sed 's/^v//')
	echo "current: $$current"
	echo "latest:  $$latest"
	if [ "$$current" = "$$latest" ]; then
		echo "-> up to date"
	else
		echo "-> update available, run 'make update'"
	fi

update:
	@current=$$(sed -n 's/^pkgver=//p' $(PKGBUILD))
	latest=$$(curl -sSf $(API) | jq -r '.tag_name' | sed 's/^v//')
	if [ "$$current" = "$$latest" ]; then
		echo "already at $$current, nothing to do"
		exit 0
	fi
	echo "==> updating $$current -> $$latest"

	tmp=$$(mktemp -d)
	trap 'rm -rf "$$tmp"' EXIT
	curl -sSfL -o "$$tmp/src.tar.gz" "https://github.com/$(REPO)/archive/v$$latest.tar.gz"
	sum=$$(sha256sum "$$tmp/src.tar.gz" | cut -d' ' -f1)

	sed -i -E "s/^pkgver=.*/pkgver=$$latest/" $(PKGBUILD)
	sed -i -E "s/^pkgrel=.*/pkgrel=1/" $(PKGBUILD)
	sed -i -E "s|^sha256sums=.*|sha256sums=(\"$$sum\")|" $(PKGBUILD)

	makepkg --printsrcinfo > $(SRCINFO)

	echo "==> updated to $$latest"

verify:
	@mkdir -p $(BUILDDIR)
	cp $(PKGBUILD) $(BUILDDIR)/
	cd $(BUILDDIR) && makepkg -f

clean:
	@rm -rf $(BUILDDIR)
