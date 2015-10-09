VERSION = 3.18.0
RELEASE = 1

.PHONY: all
all: upgrade build

upgrade:
	sed -i "s/^pkgver=.*/pkgver=$(VERSION)/g" PKGBUILD
	sed -i "s/^pkgrel=.*/pkgrel=$(RELEASE)/g" PKGBUILD
	updpkgsums
	mksrcinfo

build:
	makepkg -sf

install:
	makepkg -i

release:
	git add .SRCINFO Makefile PKGBUILD
	git commit -m "Upgpkg to $(VERSION)-$(RELEASE)"
	echo git push

clean:
	rm -rf pkg/
	rm -rf src/
	rm *.tar.xz
