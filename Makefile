
.DEFAULT_GOAL := help
.PHONY: help download_source update_hashes update_srcinfo update_all

makepkg_install: pkgbuild ## Build and install Arch package using PKGBUILD (PKGBUILD must exist)
	makepkg -si

update_hashes: ## download the source and update the checksums in PKGBUILD for all sources using
	updpkgsums

update_srcinfo: update_hashes ## Regenerate .SRCINFO from PKGBUILD
	makepkg --printsrcinfo > .SRCINFO

pkgbuild: ## Build Arch package using PKGBUILD (PKGBUILD must exist)
	make update_srcinfo
	makepkg -f

clean_build: ## Remove build, dist, *.egg-info, pkg, and src directories
	rm -rf build *.egg-info pkg src dist *.pkg.tar.zst *.tar.gz

#################################################################################
# Self Documenting Commands                                                     #

help: ## Show help. Only lines with ": ##" will show up!
	@awk -F':[[:space:]]*.*## ' '/^[a-zA-Z0-9_.-]+ *:.*## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
