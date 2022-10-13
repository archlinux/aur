all:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO
	rm *.zip
	rm *.zst