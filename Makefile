clean:
	rm -rf pkg/ src/ checksums* *tar*

prepare:
	makepkg --printsrcinfo > .SRCINFO