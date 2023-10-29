VERSION ?= 0.15.2

all: clean set-version checksums prepare

pkg:
	makepkg -s

fetch-sums:
	makepkg -g

prepare:
	makepkg --printsrcinfo > .SRCINFO

get-checksum:
	makepkg -g

checksums: get-checksum
	sed -i 's/sha256sums=\(.*\)/sha256sums=\("$(shell sha256sum checksums.txt | cut -d ' ' -f1)"\)/' PKGBUILD

set-version:
	sed -i 's/^VERSION ?= \(.*\)/VERSION ?= $(VERSION:v%=%)/' Makefile
	sed -i 's/pkgver=\(.*\)/pkgver="$(VERSION:v%=%)"/' PKGBUILD

publish:
	git add .
	git commit -m "Update to $(VERSION:v%=%)"
	git push origin master

clean:
	rm -rf pkg/ src/ checksums* *tar*
