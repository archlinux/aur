PKGNAME := kanata-switcher
UPSTREAM := 7mind/kanata-switcher
SHELL := /usr/bin/bash

CURRENT_VERSION_CMD := awk -F= '$$1 == "pkgver" { print $$2; exit }' PKGBUILD
LATEST_VERSION_CMD := curl --fail --silent --show-error --location \
	--connect-timeout 10 --max-time 30 \
	https://api.github.com/repos/$(UPSTREAM)/releases/latest | \
	jq --exit-status --raw-output '.tag_name | select(type == "string" and startswith("v")) | ltrimstr("v")'
RELEASE_TOOLS := curl git jq makepkg namcap updpkgsums

.PHONY: check-tools check-update update build lint srcinfo clean publish

check-tools:
	@missing=(); \
	for tool in $(RELEASE_TOOLS); do \
		command -v "$$tool" >/dev/null || missing+=("$$tool"); \
	done; \
	(($${#missing[@]} == 0)) || { \
		printf 'ERROR: Missing tools: %s\n' "$${missing[*]}" >&2; \
		printf 'Install them with: sudo pacman --sync --needed jq namcap pacman-contrib\n' >&2; \
		exit 1; \
	}

check-update: check-tools
	@current=$$($(CURRENT_VERSION_CMD)) || exit 1; \
	latest=$$($(LATEST_VERSION_CMD)) || exit 1; \
	[[ $$latest =~ ^[0-9]+([.][0-9A-Za-z]+)*$$ ]] || { \
		printf 'ERROR: Invalid upstream version: %s\n' "$$latest" >&2; \
		exit 1; \
	}; \
	printf 'Current: %s\nLatest:  %s\n' "$$current" "$$latest"; \
	if [[ $$current == "$$latest" ]]; then \
		printf 'Up to date.\n'; \
	else \
		printf 'Update available: %s -> %s\n' "$$current" "$$latest"; \
	fi

update: check-tools
	@current=$$($(CURRENT_VERSION_CMD)) || exit 1; \
	latest=$$($(LATEST_VERSION_CMD)) || exit 1; \
	[[ $$latest =~ ^[0-9]+([.][0-9A-Za-z]+)*$$ ]] || { \
		printf 'ERROR: Invalid upstream version: %s\n' "$$latest" >&2; \
		exit 1; \
	}; \
	if [[ $$current == "$$latest" ]]; then \
		printf 'Already at %s, nothing to do.\n' "$$current"; \
		exit 0; \
	fi; \
	backup=$$(mktemp) || exit 1; \
	cp -- PKGBUILD "$$backup" || { rm --force -- "$$backup"; exit 1; }; \
	updated=false; \
	trap 'if ! $$updated; then cp -- "$$backup" PKGBUILD; fi; rm --force -- "$$backup"' EXIT; \
	sed --in-place "s/^pkgver=.*/pkgver=$$latest/; s/^pkgrel=.*/pkgrel=1/" PKGBUILD || exit 1; \
	updpkgsums || exit 1; \
	updated=true; \
	printf 'Updated to %s\n' "$$latest"

build:
	makepkg --syncdeps --cleanbuild --force

lint:
	namcap PKGBUILD
	@found=false; \
	while IFS= read -r package; do \
		[[ $${package##*/} == $(PKGNAME)-debug-* ]] && continue; \
		[[ -f $$package ]] || { printf 'ERROR: Package not found: %s\n' "$$package" >&2; exit 1; }; \
		namcap "$$package" || exit 1; \
		found=true; \
	done < <(makepkg --packagelist); \
	$$found || { printf 'ERROR: No package artifact found. Run make build first.\n' >&2; exit 1; }

srcinfo:
	@tmp=$$(mktemp) || exit 1; \
	trap 'rm --force -- "$$tmp"' EXIT; \
	makepkg --printsrcinfo > "$$tmp" || exit 1; \
	mv -- "$$tmp" .SRCINFO

clean:
	rm --recursive --force src/ pkg/

publish: check-tools
	@[[ $$(git branch --show-current) == master ]] || { \
		printf 'ERROR: AUR releases must be published from master.\n' >&2; \
		exit 1; \
	}; \
	[[ $$(git remote get-url --push origin) == ssh://aur@aur.archlinux.org/$(PKGNAME).git ]] || { \
		printf 'ERROR: origin is not the $(PKGNAME) AUR repository.\n' >&2; \
		exit 1; \
	}; \
	[[ -z $$(git status --porcelain) ]] || { \
		printf 'ERROR: Commit or discard existing changes before publishing.\n' >&2; \
		exit 1; \
	}; \
	original_head=$$(git rev-parse HEAD) || exit 1; \
	committed=false; \
	trap 'status=$$?; if ((status != 0)) && ! $$committed; then git restore --source="$$original_head" --staged --worktree -- PKGBUILD .SRCINFO; fi' EXIT; \
	$(MAKE) update || exit 1; \
	$(MAKE) build || exit 1; \
	$(MAKE) lint || exit 1; \
	$(MAKE) srcinfo || exit 1; \
	git diff --check || exit 1; \
	git add -- PKGBUILD .SRCINFO || exit 1; \
	if ! git diff --cached --quiet; then \
		version=$$($(CURRENT_VERSION_CMD)) || exit 1; \
		git commit --gpg-sign --message "feat: update to $$version" || exit 1; \
		committed=true; \
	fi; \
	git verify-commit HEAD || exit 1; \
	trap - EXIT; \
	git push origin master
