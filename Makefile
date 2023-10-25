package: .SRCINFO
	makepkg -f

install:
	makepkg -i

check:
	namcap *.pkg.*

update: .SRCINFO
	git add PKGBUILD .SRCINFO
	git commit
	git push
	git push aur

clean:
	rm -rf pkg src *.pkg.tar.*

.SRCINFO: PKGBUILD
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO
