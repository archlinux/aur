.PHONY: post clean upgrade versions

LATEST_VER := $(shell curl -s https://update.tryshift.com/download/version | sed 's/.* version //; s/ .*/\n/')

versions:
	@echo "Current version:"
	@grep '^pkgver' PKGBUILD | sed 's/.*=/  /'
	@echo "Latest version:"
	@echo "  $(LATEST_VER)"

upgrade:
	perl -pi -e 's/^pkgver=.+/pkgver=$(LATEST_VER)/' PKGBUILD
	bash -c 'perl -pi -e "s/^sha256sums=.+/$$(makepkg -g)/" PKGBUILD'
	make post
	git add .SRCINFO PKGBUILD
	git commit -m "Upgrade to $(LATEST_VER)" .SRCINFO PKGBUILD
	git show

post:
	makepkg --verifysource -f
	makepkg --printsrcinfo > .SRCINFO

clean:
	git clean -fX
