pkg:
	makepkg -s

prepare:
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg/ src/ checksums* *tar*
