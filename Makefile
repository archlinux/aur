all:
	rm -f symfony-installer_*
	rm -f symfony-installer-bin*
	makepkg -s | true
	updpkgsums
	rm -f symfony-installer-bin*
	makepkg -s
	mksrcinfo
