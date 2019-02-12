clean:
	rm -f *xz
	rm -f *gz
	rm -rf pkg
	rm -rf src

srcinfo:
	makepkg --printsrcinfo > .SRCINFO
