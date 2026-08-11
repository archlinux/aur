.PHONY: help install clean nuke srcinfo sha

help: ## Show available commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

install: srcinfo ## Build and install locally
	makepkg -si

srcinfo: PKGBUILD ## Regenerate .SRCINFO
	makepkg --printsrcinfo > .SRCINFO

clean: ## Remove build artifacts
	rm -rf pkg/ src/ *.pkg.tar.zst *.tar.gz *.tar.xz

nuke: ## Full clean including git-ignored files
	git clean -xdf

PKGVER := $(shell grep '^pkgver=' PKGBUILD | cut -d= -f2)
TARBALL := pulse-remote_$(PKGVER)_Linux_x86_64.tar.gz
URL := https://github.com/undg/pulse-remote/releases/download/v$(PKGVER)/$(TARBALL)

sha: ## Download tarball and update sha256sum in PKGBUILD
	@curl -sLO "$(URL)"
	@SHA=$$(sha256sum "$(TARBALL)" | cut -d' ' -f1); \
	sed -i "s|sha256sums=('[^)]*')|sha256sums=('$$SHA')|" PKGBUILD
	@echo "Updated sha256sum: $$SHA"
