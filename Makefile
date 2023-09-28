pkg:
	makepkg -s

fetch-sums:
	makepkg -g

prepare:
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg/ src/ checksums* *tar*
