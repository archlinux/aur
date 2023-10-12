VERSION ?= 0.13.3

all: clean set-version prepare

pkg:
	makepkg -s

prepare:
	makepkg --printsrcinfo > .SRCINFO

set-version:
	sed -i 's/^VERSION ?= \(.*\)/VERSION ?= $(VERSION:v%=%)/' Makefile
	sed -i 's/pkgver=\(.*\)/pkgver="$(VERSION:v%=%)"/' PKGBUILD

publish:
	git add .
	git commit -m "Update to $(VERSION:v%=%)"
	git push origin master

clean:
	rm -rf pkg/ src/ node/ webmesh/ *.tar.zst
