# Update the checksums and build the package
all:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO
	makepkg -sr

# Same as all, but will install it to the local system as well
install:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO
	makepkg -sri

# Updates PKGBUILD with the latest version and build the package
update:
	sed 's/^pkgver=.*$$/pkgver=$(shell $(MAKE) -s versions | head -n 1)/' -i PKGBUILD
	sed 's/^pkgrel=.*$$/pkgrel=1/' -i PKGBUILD
	$(MAKE)

# List the versions available on GitHub
versions:
	@curl -s https://api.github.com/repos/jbangdev/jbang/releases | jq -r ".[] | .tag_name | ltrimstr(\"v\")"

# Remove the files downloaded and created in the build process
clean:
	rm -rf pkg src jbang-*.tar jbang-*.pkg.tar.zst LICENSE

publish:
	git add .
	git commit -m "Update to version $(shell $(MAKE) -s versions | head -n 1)."
	git push
	git push origin master
