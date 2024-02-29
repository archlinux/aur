# This will update the checksums and build the package
all: updateinfo
	makepkg -sr

# This will do the same as all, but will install it to the local system as well
install: updateinfo
	makepkg -sri

# This will update the checksums and .SRCINFO
updateinfo:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO

# This will remove the files downloaded and created in the build process
clean:
	rm -rf pkg src yass-reloaded-*.pkg.* *.jar

publish:
	git add .
	git commit -m "Update to version $(shell sed -n 's/^pkgver=\(.*\)$$/\1/p' PKGBUILD)"
#	git push
