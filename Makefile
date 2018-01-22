VERSION := $(shell grep "pkgver=" PKGBUILD | cut -d"=" -f2)
RELEASE := $(shell grep "pkgrel=" PKGBUILD | cut -d"=" -f2)

default:

update:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO
	git add PKGBUILD .SRCINFO
	git commit -m "release $(VERSION)-$(RELEASE)"
	git tag "$(VERSION)-$(RELEASE)"

.PHONY: default
