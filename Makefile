.PHONY: auto-update clean post test-upgrade upgrade versions

CURRENT_VER       := $(shell grep '^pkgver' PKGBUILD | sed 's/.*=//')
LATEST_VER_FULL   := $(shell curl -s https://get.atomicwallet.io/download/ | grep 'atomicwallet-2.*\.rpm"' | sort | tail -1 | sed 's/.*wallet-\(2[0-9.-]*\)\.rpm.*/\1/')
LATEST_VER        := $(firstword $(subst -, ,$(LATEST_VER_FULL)))
LATEST_VER_SUFFIX := $(lastword $(subst -, ,$(LATEST_VER_FULL)))

versions:
	@echo "Current version:"
	@echo "  $(CURRENT_VER)"
	@echo "Latest version:"
	@echo "  $(LATEST_VER)"

test-upgrade:
	perl -pi -e 's/^pkgver=.+/pkgver=$(LATEST_VER)/' PKGBUILD
	perl -pi -e 's/^_pkgver_suffix=.+/_pkgver_suffix=$(LATEST_VER_SUFFIX)/' PKGBUILD
	bash -c 'perl -pi -e "s/^sha256sums=.+/$$(makepkg -g)/" PKGBUILD'

upgrade:
	@make test-upgrade
	@make post
	git add .SRCINFO PKGBUILD
	git commit -m "Upgrade to $(LATEST_VER)" .SRCINFO PKGBUILD

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
