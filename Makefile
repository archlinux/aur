# AUR package maintenance automation (requires: bash, makepkg, updpkgsums)
SHELL := /bin/bash
.DELETE_ON_ERROR:

UPSTREAM_URL    ?= $(shell sed -n "s/^url=//p" PKGBUILD | sed 's/[[:space:]]*#.*//' | tr -d "\"'")
CURRENT_PKGVER  := $(shell awk -F= '/^pkgver=/ {print $$2; exit}' PKGBUILD)
LATEST_UPSTREAM := $(shell git ls-remote --tags '$(UPSTREAM_URL).git' 2>/dev/null | grep -oP 'refs/tags/v\K[0-9]+\.[0-9]+\.[0-9]+' | sort -V | tail -1)
AUR_REMOTE      ?= label
AUR_BRANCH      ?= master

# Reusable validation for version variables
define check-vars
	@if [ -z "$(CURRENT_PKGVER)" ]; then echo "ERROR: pkgver not found in PKGBUILD"; exit 1; fi
	@if [ -z "$(LATEST_UPSTREAM)" ]; then echo "ERROR: No version tags found at $(UPSTREAM_URL)"; exit 1; fi
endef

.PHONY: help build check bump bump-dry publish release release-dry clean nvcheck

help:
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z_-]+:.*##/ {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Build package
	makepkg --noconfirm --noprogressbar

check: ## Compare local pkgver against latest upstream release
	$(check-vars)
	@echo "current:  $(CURRENT_PKGVER)"
	@echo "upstream: $(LATEST_UPSTREAM)"
	@if [ "$(CURRENT_PKGVER)" = "$(LATEST_UPSTREAM)" ]; then \
		echo "status:   up-to-date"; \
	else \
		echo "status:   UPDATE AVAILABLE ($(CURRENT_PKGVER) -> $(LATEST_UPSTREAM))"; \
	fi

nvcheck: ## Check for upstream updates via nvchecker
	@nvchecker -c .nvchecker.toml && nvcmp -c .nvchecker.toml

bump: ## Update PKGBUILD to latest upstream + regenerate .SRCINFO
	$(check-vars)
	@if [ "$(CURRENT_PKGVER)" = "$(LATEST_UPSTREAM)" ]; then \
		echo "Already at $(CURRENT_PKGVER). Nothing to do."; \
		exit 0; \
	fi
	@echo "Bumping $(CURRENT_PKGVER) -> $(LATEST_UPSTREAM)"
	@cp PKGBUILD PKGBUILD.bak
	@sed -i "s/^pkgver=.*/pkgver=$(LATEST_UPSTREAM)/" PKGBUILD
	@sed -i "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
	@if ! updpkgsums; then \
		mv PKGBUILD.bak PKGBUILD; \
		echo "ERROR: updpkgsums failed. PKGBUILD restored."; \
		exit 1; \
	fi
	@rm -f PKGBUILD.bak
	@makepkg --printsrcinfo > .SRCINFO.tmp && mv .SRCINFO.tmp .SRCINFO || { rm -f .SRCINFO.tmp; exit 1; }

bump-dry: ## Preview what bump would do (no changes)
	$(check-vars)
	@echo "current:  $(CURRENT_PKGVER)"
	@echo "upstream: $(LATEST_UPSTREAM)"
	@if [ "$(CURRENT_PKGVER)" = "$(LATEST_UPSTREAM)" ]; then \
		echo "status:   up-to-date — nothing to do"; \
	else \
		echo "would bump: $(CURRENT_PKGVER) -> $(LATEST_UPSTREAM)"; \
	fi

publish: ## Commit PKGBUILD + .SRCINFO and push to AUR
	@makepkg --printsrcinfo > .SRCINFO.gen
	@if ! diff -u .SRCINFO .SRCINFO.gen > /dev/null 2>&1; then \
		echo "ERROR: .SRCINFO does not match generated output. Run 'make bump' first."; \
		diff -u .SRCINFO .SRCINFO.gen || true; \
		rm -f .SRCINFO.gen; \
		exit 1; \
	fi
	@rm -f .SRCINFO.gen
	@git add PKGBUILD .SRCINFO
	@if git diff --cached --quiet; then \
		echo "No PKGBUILD/.SRCINFO changes to commit."; \
	else \
		pkgver=$$(awk -F= '/^pkgver=/ {print $$2; exit}' PKGBUILD); \
		git commit -m "Update to $$pkgver" || { echo "ERROR: Commit failed"; exit 1; }; \
		if ! git push "$(AUR_REMOTE)" HEAD:"$(AUR_BRANCH)"; then \
			echo "WARNING: Push failed. Commit exists locally. Run 'git push' manually."; \
			exit 1; \
		fi; \
	fi

release: ## End-to-end: bump -> build -> publish (stops on first failure)
	@$(MAKE) --no-print-directory bump
	@$(MAKE) --no-print-directory build
	@$(MAKE) --no-print-directory publish

release-dry: ## Preview release (no changes): bump-dry + dry-run info
	@$(MAKE) --no-print-directory bump-dry
	@echo "---"
	@echo "build:     would run makepkg --noconfirm --noprogressbar"
	@echo "publish:   would commit and push to $(AUR_REMOTE)/$(AUR_BRANCH)"

clean: ## Remove build artifacts
	rm -rf src/ pkg/ ./*.pkg.tar.zst ./*.tar.gz .SRCINFO.gen ./*.log
