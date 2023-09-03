update:
	echo "I assume you already updated the sources URLs."
	updpkgsums
	makepkg -s
	makepkg --printsrcinfo > .SRCINFO
