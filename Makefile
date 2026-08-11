.PHONY: help install clean nuke srcinfo sha

help: ## Show available commands
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

install: srcinfo ## Build and install locally
	makepkg -si

srcinfo: PKGBUILD ## Regenerate .SRCINFO
	makepkg --printsrcinfo > .SRCINFO

clean: ## Remove build artifacts
	rm -rf pkg/ src/ *.pkg.tar.zst *.tar.gz *.tar.xz pulse-remote-git

nuke: ## Full clean including git-ignored files
	git clean -xdf

