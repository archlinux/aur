all:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO
	rm -f *.zip
	rm -f *.zst