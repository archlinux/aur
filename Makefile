clean:
	rm -rf pkg/ src/ node/ *tar*

prepare:
	makepkg --printsrcinfo > .SRCINFO