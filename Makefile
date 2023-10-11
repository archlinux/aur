VERSION ?= 0.13.1

all: clean set-version prepare pkg

pkg:
	makepkg -s

prepare:
	makepkg --printsrcinfo > .SRCINFO

set-version:
	sed -i 's/^VERSION ?= \(.*\)/VERSION ?= $(VERSION)/' Makefile
	sed -i 's/pkgver=\(.*\)/pkgver="$(VERSION)"/' PKGBUILD

publish:
	git add .
	git commit -m "Update to $(VERSION)"
	git push origin master

clean:
	rm -rf pkg/ src/ node/ webmesh/ *.tar.zst
