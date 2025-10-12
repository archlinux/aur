.ONESHELL:
SHELL=bash

.buildenvid: build-dev.Dockerfile
	docker build \
	  -f build-dev.Dockerfile \
	  -t archlinux-build-dev \
	  --build-arg USERID=$$(id -u) \
	  --build-arg GROUPID=$$(id -g) \
	  --iidfile .buildenvid \
	  .

BUILDENV=docker run --rm -v $(PWD):/build -i $$(cat .buildenvid)

.PHONY: update-checksums
update-checksums: PKGBUILD .buildenvid
	$(BUILDENV) <<EOF
	makepkg --noconfirm -s -e -o -C -c
	updpkgsums
	EOF

.SRCINFO: PKGBUILD .buildenvid
	$(BUILDENV) <<EOF
	makepkg --printsrcinfo > .SRCINFO
	EOF

VERSION=$(shell sed -En "s/pkgver='(.*)'/\1/p" PKGBUILD)
ARCH=x86_64
PACKAGES=exfetch-$(VERSION)-1-$(ARCH).pkg.tar.zst exfetch-debug-$(VERSION)-1-$(ARCH).pkg.tar.zst

$(PACKAGES): PKGBUILD .buildenvid
	$(BUILDENV) <<EOF
	namcap PKGBUILD
	makepkg --noconfirm -s
	makepkg --noconfirm -i
	namcap $PACKAGE
	EOF
