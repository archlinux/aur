VERSION = 4.5.0
RELEASE = 1

release:
	sed -i 's/^pkgver=/pkgver=$(VERSION)/g' PKGBUILD
	sed -i 's/^pkgrel=/pkgrel=$(RELEASE)/g' PKGBUILD
	mksrcinfo
	updpkgsums
	rm v$(VERSION).tar.gz
	git add .SRCINFO Makefile PKGBUILD
	git commit -m "Release v$(VERSION)"
	git push

.PHONY: release
