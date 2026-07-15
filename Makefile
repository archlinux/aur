# Auto-extracted from PKGBUILD url (works for any forge: GitHub, GitLab, Codeberg...)
UPSTREAM_URL ?= $(shell awk -F= '/^url=/{gsub(/'"'"'/, "", $$2); print $$2}' PKGBUILD)

.PHONY: help build check bump publish release clean

help:
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z_-]+:.*##/ {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Build package
	makepkg --noconfirm --noprogressbar

check: ## Compare local pkgver against latest upstream release
	@current=$$(awk -F= '/^pkgver=/ {print $$2; exit}' PKGBUILD); \
	upstream=$$(git ls-remote --tags '$(UPSTREAM_URL).git' 2>/dev/null | grep -oP 'refs/tags/v\K[0-9]+\.[0-9]+\.[0-9]+' | sort -V | tail -1); \
	if [ -z "$$upstream" ]; then echo "ERROR: No version tags found at $(UPSTREAM_URL)"; exit 1; fi; \
	echo "current:  $$current"; \
	echo "upstream: $$upstream"; \
	if [ "$$current" = "$$upstream" ]; then \
		echo "status:   up-to-date"; \
	else \
		echo "status:   UPDATE AVAILABLE ($$current -> $$upstream)"; \
	fi

bump: ## Update PKGBUILD to latest upstream + regenerate .SRCINFO
	@current=$$(awk -F= '/^pkgver=/ {print $$2; exit}' PKGBUILD); \
	upstream=$$(git ls-remote --tags '$(UPSTREAM_URL).git' 2>/dev/null | grep -oP 'refs/tags/v\K[0-9]+\.[0-9]+\.[0-9]+' | sort -V | tail -1); \
	if [ -z "$$upstream" ]; then echo "ERROR: No version tags found at $(UPSTREAM_URL)"; exit 1; fi; \
	if [ "$$current" = "$$upstream" ]; then \
		echo "Already at $$current. Nothing to do."; \
		exit 0; \
	fi; \
	echo "Bumping $$current -> $$upstream"; \
	sed -i "s/^pkgver=.*/pkgver=$$upstream/" PKGBUILD; \
	sed -i "s/^pkgrel=.*/pkgrel=1/"          PKGBUILD; \
	updpkgsums; \
	makepkg --printsrcinfo > .SRCINFO

publish: ## Commit PKGBUILD + .SRCINFO and push to AUR
	@makepkg --printsrcinfo > .SRCINFO.gen; \
	diff -u .SRCINFO .SRCINFO.gen >/dev/null || { echo "ERROR: .SRCINFO does not match generated output. Run 'make bump' first."; rm -f .SRCINFO.gen; exit 1; }; \
	rm -f .SRCINFO.gen; \
	if ! git diff --quiet PKGBUILD .SRCINFO; then \
		pkgver=$$(awk -F= '/^pkgver=/ {print $$2; exit}' PKGBUILD); \
		git add PKGBUILD .SRCINFO && git commit -m "Update to $$pkgver"; \
	else \
		echo "No PKGBUILD/.SRCINFO changes to commit."; \
	fi; \
	git push label HEAD:master

release: ## End-to-end: bump -> build -> publish (stops on first failure)
	@$(MAKE) --no-print-directory bump
	@$(MAKE) --no-print-directory build
	@$(MAKE) --no-print-directory publish

clean: ## Remove build artifacts
	rm -rf src/ pkg/ ./*.pkg.tar.zst ./*.tar.gz .SRCINFO.gen ./*.log
