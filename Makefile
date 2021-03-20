.PHONY: post clean upgrade versions auto-update

CURRENT_VER := $(shell grep '^pkgver' PKGBUILD | sed 's/.*=//')
LATEST_VER  := $(shell curl -s https://github.com/CryptoGraphics/VerthashMiner/releases/latest | perl -pe 's!.*/tag/v?([0-9].+?)".*!$$1!')

versions:
	@echo "Current version:"
	@echo "  $(CURRENT_VER)"
	@echo "Latest version:"
	@echo "  $(LATEST_VER)"

upgrade:
	perl -pi -e 's/^pkgver=.+/pkgver=$(LATEST_VER)/' PKGBUILD
	bash -c 'perl -pi -e "s/^sha256sums=[^)]+\)/$$(makepkg -g)/" PKGBUILD'
	make post
	git add .SRCINFO PKGBUILD
	git commit -m "Upgrade to $(LATEST_VER)" .SRCINFO PKGBUILD
	git show

post:
	makepkg --verifysource -f
	makepkg --printsrcinfo > .SRCINFO

clean:
	git clean -fX

auto-update:
ifeq ($(CURRENT_VER),$(LATEST_VER))
	@echo "No update available. Version: $(CURRENT_VER)"
else
	@make upgrade && git push
endif
