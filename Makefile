VERSION:=$(version)

release: update test
	makepkg --printsrcinfo > .SRCINFO

update: 
	sed -i -e "s/^\(pkgver=*\)\(.*\)*/\1$(VERSION)/" PKGBUILD
	updpkgsums

test:
	makepkg --verifysource

install:
	makepkg -sir

clean:
	rm alfaview_*.deb
