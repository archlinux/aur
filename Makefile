VERSION ?= 0.13.1

all: clean set-version checksums prepare pkg
	git add .
	git commit -m "Update to $(VERSION)"
	git tag -a v$(VERSION) -m "Update to $(VERSION)"
	git push origin master --tags

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
	sed -i 's/pkgver=\(.*\)/pkgver="$(VERSION)"/' PKGBUILD

clean:
	rm -rf pkg/ src/ checksums* *tar*
