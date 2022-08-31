package: .SRCINFO
	makepkg -f

install:
	makepkg -i

srcinfo: .SRCINFO

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

update: .SRCINFO
	git add PKGBUILD .SRCINFO
	git commit
	git push
	git push aur

clean:
	rm -rf pkg src *.pkg.tar.*
