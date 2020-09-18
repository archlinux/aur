.PHONY: post clean versions

versions:
	@echo "Current version:"
	@grep '^pkgver' PKGBUILD | sed 's/.*=/  /'
	@echo "Latest version:"
	@curl -s https://update.tryshift.com/download/version | sed 's/.* version //; s/ .*/\n/; s/^/  /'

post:
	makepkg --verifysource -f
	makepkg --printsrcinfo > .SRCINFO

clean:
	git clean -fX
