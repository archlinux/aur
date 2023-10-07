pkg:
	makepkg -s

fetch-sums:
	makepkg -g

prepare:
	makepkg --printsrcinfo > .SRCINFO

checksums:
	makepkg -g

clean:
	rm -rf pkg/ src/ checksums* *tar*
