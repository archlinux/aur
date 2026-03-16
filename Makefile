PKGNAME := kanata-switcher
UPSTREAM := 7mind/kanata-switcher

CURRENT_VER := $(shell sed --quiet 's/^pkgver=//p' PKGBUILD)
LATEST_VER := $(shell curl --silent https://api.github.com/repos/$(UPSTREAM)/releases/latest | jq --raw-output '.tag_name | ltrimstr("v")')

.PHONY: check-update update build lint srcinfo clean publish

check-update:
	@echo "Current: $(CURRENT_VER)"
	@echo "Latest:  $(LATEST_VER)"
	@if [ "$(CURRENT_VER)" = "$(LATEST_VER)" ]; then \
		echo "Up to date."; \
	else \
		echo "Update available: $(CURRENT_VER) -> $(LATEST_VER)"; \
	fi

update:
	@if [ -z "$(LATEST_VER)" ]; then \
		echo "ERROR: Could not fetch latest version from GitHub" >&2; \
		exit 1; \
	fi
	@if [ "$(CURRENT_VER)" = "$(LATEST_VER)" ]; then \
		echo "Already at $(CURRENT_VER), nothing to do."; \
		exit 0; \
	fi
	sed --in-place "s/^pkgver=.*/pkgver=$(LATEST_VER)/" PKGBUILD
	sed --in-place "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
	updpkgsums
	@echo "Updated to $(LATEST_VER)"

build:
	makepkg --syncdeps --force

lint:
	namcap PKGBUILD
	namcap $(PKGNAME)-$(CURRENT_VER)-*.pkg.tar.zst

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm --recursive --force src/ pkg/ *.tar.gz *.pkg.tar.zst

publish: clean update build lint srcinfo
	$(MAKE) clean
	git add PKGBUILD .SRCINFO
	git commit --message "feat: update to $(LATEST_VER)"
	git push
