

release:
	namcap PKGBUILD
	makepkg --printsrcinfo > .SRCINFO
	makepkg -f
	git add .
	git commit -a -m "Release"
	git push origin
	git push aur
