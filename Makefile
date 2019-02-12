clean:
	rm -f *xz
	rm -f *gz
	rm -rf src
	rm -rf pkg

srcinfo:
	makepkg --printsrcinfo > .SRCINFO
