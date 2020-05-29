package: clean
	makepkg

update: clean updatechecksums srcinfo
		updpkgsums

updatechecksums:
	updpkgsums


srcinfo: .SRCINFO

.SRCINFO: PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg src *.tar.gz *.tar.xz
