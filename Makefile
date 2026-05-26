UPSTREAM_REPO := hashicorp/terraform-mcp-server
ARCH_IMAGE    := archlinux:base-devel
PACMAN_DEPS   := go git pacman-contrib jq curl sudo

define DOCKER_RUN
	@test -n "$$CMD" || { echo "CMD env var is required"; exit 1; }
	docker run --rm -e CMD -v "$$PWD:/work" -w /work $(ARCH_IMAGE) bash -euo pipefail -c '\
		pacman -Syu --noconfirm --needed $(PACMAN_DEPS) >/dev/null; \
		useradd -m builder; \
		chown -R builder:builder /work; \
		echo "builder ALL=(ALL) NOPASSWD: ALL" >/etc/sudoers.d/builder; \
		su builder -c "cd /work && $$CMD"'
endef

.PHONY: help check bump build publish release clean _in-container

help:
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z_-]+:.*##/ {printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

check: ## Compare local pkgver against latest upstream release
	@current=$$(awk -F= '/^pkgver=/ {print $$2; exit}' PKGBUILD); \
	upstream=$$(curl -sSL https://api.github.com/repos/$(UPSTREAM_REPO)/releases/latest | jq -r '.tag_name' | sed 's/^v//'); \
	echo "current:  $$current"; \
	echo "upstream: $$upstream"; \
	if [ "$$current" = "$$upstream" ]; then \
		echo "status:   up-to-date"; \
	else \
		echo "status:   UPDATE AVAILABLE ($$current -> $$upstream)"; \
	fi

bump: ## Update PKGBUILD to latest upstream + regenerate .SRCINFO
	@current=$$(awk -F= '/^pkgver=/ {print $$2; exit}' PKGBUILD); \
	upstream=$$(curl -sSL https://api.github.com/repos/$(UPSTREAM_REPO)/releases/latest | jq -r '.tag_name' | sed 's/^v//'); \
	if [ "$$current" = "$$upstream" ]; then \
		echo "Already at $$current. Nothing to do."; \
		exit 0; \
	fi; \
	echo "Bumping $$current -> $$upstream"; \
	sed -i "s/^pkgver=.*/pkgver=$$upstream/" PKGBUILD; \
	sed -i "s/^pkgrel=.*/pkgrel=1/"          PKGBUILD; \
	CMD='updpkgsums && makepkg --printsrcinfo > .SRCINFO' $(MAKE) --no-print-directory _in-container

build: ## Build in Arch container, install the result, run --version smoke-test
	@cp PKGBUILD .PKGBUILD.pre-build && cp .SRCINFO .SRCINFO.pre-build
	@CMD='makepkg -s --noconfirm --noprogressbar && sudo pacman -U --noconfirm ./*.pkg.tar.zst && out=$$(terraform-mcp-server --version) && echo "$$out" && expected=$$(awk -F= "/^pkgver=/ {print \$$2; exit}" PKGBUILD) && echo "$$out" | grep -F "$$expected" >/dev/null || { echo "Version mismatch: expected $$expected"; exit 1; }' \
		$(MAKE) --no-print-directory _in-container; \
		rc=$$?; \
		if ! cmp -s PKGBUILD .PKGBUILD.pre-build || ! cmp -s .SRCINFO .SRCINFO.pre-build; then \
			echo "ERROR: PKGBUILD/.SRCINFO mutated during build (upstream code execution wrote packaging files)."; \
			diff -u .PKGBUILD.pre-build PKGBUILD || true; \
			diff -u .SRCINFO.pre-build .SRCINFO || true; \
			rm -f .PKGBUILD.pre-build .SRCINFO.pre-build; \
			exit 1; \
		fi; \
		rm -f .PKGBUILD.pre-build .SRCINFO.pre-build; \
		exit $$rc

publish: ## Commit PKGBUILD + .SRCINFO and push to AUR
	@if [ ! -f .SRCINFO ]; then echo ".SRCINFO missing. Run 'make bump' first."; exit 1; fi
	@CMD='makepkg --printsrcinfo > .SRCINFO.gen' $(MAKE) --no-print-directory _in-container
	@diff -u .SRCINFO .SRCINFO.gen >/dev/null || { echo "ERROR: .SRCINFO does not match generated output. Run 'make bump' or inspect with 'diff -u .SRCINFO .SRCINFO.gen'."; rm -f .SRCINFO.gen; exit 1; }
	@rm -f .SRCINFO.gen
	@if ! git diff --quiet PKGBUILD .SRCINFO; then \
		pkgver=$$(awk -F= '/^pkgver=/ {print $$2; exit}' PKGBUILD); \
		git add PKGBUILD .SRCINFO && git commit -m "Update to $$pkgver"; \
	else \
		echo "No PKGBUILD/.SRCINFO changes to commit."; \
	fi
	git push aur HEAD:master

release: ## End-to-end: bump -> build -> publish (stops on first failure)
	@$(MAKE) --no-print-directory bump
	@$(MAKE) --no-print-directory build
	@$(MAKE) --no-print-directory publish

clean: ## Remove build artifacts
	rm -rf src/ pkg/ ./*.pkg.tar.zst ./*.tar.gz .SRCINFO.gen .PKGBUILD.pre-build .SRCINFO.pre-build

_in-container:
	$(DOCKER_RUN)
