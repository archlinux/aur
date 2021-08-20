.PHONY: aur metadata pkg

pkg:
	makepkg

metadata:
	mkdir -p src
	cd src && updpkgsums ../PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

aur:
	git push aur arch:master
