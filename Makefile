clean:
	rm -f *xz *gz

srcinfo:
	makepkg --printsrcinfo > .SRCINFO
