pkg:
	makepkg -s

fetch-sums:
	makepkg -g

prepare:
	makepkg --printsrcinfo > .SRCINFO

get-checksum:
	makepkg -g

checksums: get-checksum
	sed -i "s/sha256sums=\(.*\)/sha256sums=\('$(shell sha256sum checksums.txt | cut -d ' ' -f1)'\)/" PKGBUILD

clean:
	rm -rf pkg/ src/ checksums* *tar*
