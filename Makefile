VERSION:=$(version)

release: update test
	makepkg --printsrcinfo > .SRCINFO
	git add .SRCINFO PKGBUILD
	git commit -m "update to $(VERSION)"

update: 
	sed -i -e "s/^\(pkgver=*\)\(.*\)*/\1$(VERSION)/" PKGBUILD
	updpkgsums

test:
	makepkg --verifysource

install:
	makepkg -sir

clean:
	rm alfaview_*.deb
	rm -rf src/
	rm -rf pkg/
