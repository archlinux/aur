.PHONY: aur metadata pkg

pkg:
	makepkg

metadata:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO

aur:
	git push aur arch:master
