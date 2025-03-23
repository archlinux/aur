
# This will update the checksums and build the package
all: updateinfo
	makepkg -sr

# This will do the same as all, but will install it to the local system as well
install: updateinfo
	makepkg -si

# This will update the checksums and .SRCINFO
updateinfo:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO

# This will update PKGBUILD with the latest version and build the package
update:
	@LAST_VERSION=$(shell curl -s "https://api.github.com/repos/sumruler/typora-theme-phycat/releases/latest" | jq -r ".tag_name[1:]") && \
	echo "Latest version: $$LAST_VERSION" && \
	sed "s/^pkgver=.*/pkgver=$$LAST_VERSION/g" -i PKGBUILD && \
	sed 's/^pkgrel=.*/pkgrel=1/g' -i PKGBUILD && \
	$(MAKE) updateinfo && \
	$(MAKE) publish

# This will list the versions available in the Ubuntu repository
versions:
	curl -s https://api.github.com/repos/sumruler/typora-theme-phycat/releases| less | jq -r '.[].tag_name' | tr -d 'v' | sort

# This will remove the files downloaded and created in the build process
clean:
	rm -rf pkg/ src/ *.zip *.pkg.tar.zst .history

test:
	sudo pacman -Rcns typora-theme-phycat --noconfirm 2> /dev/null || echo "No installed !"
	rm -rf pkg/ src/ *.pkg.tar.zst .history
	makepkg -si

publish:
	git add .
	git commit -m "Update to version $(shell sed -n 's/^pkgver=\(.*\)$$/\1/p' PKGBUILD)"
	echo "commit $(shell sed -n 's/^pkgver=\(.*\)$$/\1/p' PKGBUILD)"
#	git push
