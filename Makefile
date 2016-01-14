VERSION = 3.42.29
RELEASE = 1

release:
	sed -i "s/^pkgver=.*/pkgver=$(VERSION)/" PKGBUILD
	sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
	updpkgsums
	mksrcinfo
	rm "heroku-client-$(VERSION).tgz"
	git add .SRCINFO Makefile PKGBUILD
	git commit -m "Release v$(VERSION)"
	git push

.PHONY: release
