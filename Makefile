VERSION = 0.1.0
RELEASE = 1

release: PKGBUILD .SRCINFO
	updpkgsums
	rm v$(VERSION).tar.gz
	git add .SRCINFO Makefile PKGBUILD
	git commit -m "Release v$(VERSION)"
	#git push

PKGBUILD:
	sed -i 's/^pkgver=.*/pkgver=$(VERSION)/g' PKGBUILD
	sed -i 's/^pkgrel=.*/pkgrel=$(RELEASE)/g' PKGBUILD

.SRCINFO:
	makepkg --printsrcinfo > .SRCINFO

.PHONY: release
