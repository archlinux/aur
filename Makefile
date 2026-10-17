SHELL := /usr/bin/bash
.DEFAULT_GOAL := check-update
.NOTPARALLEL:
.PHONY: check-update update lint srcinfo publish test

check-update update:
	@release=$$(curl --fail --silent --show-error --location --max-time 60 https://api.github.com/repos/7mind/kanata-switcher/releases/latest) || exit 1; \
	latest=$$(jq --slurp --exit-status --raw-output 'select(length == 1) | .[0].tag_name | select(type == "string" and test("^v[0-9]+([.][0-9]+)+$$")) | ltrimstr("v")' <<< "$$release") || exit 1; \
	current=$$(sed --quiet 's/^pkgver=//p' PKGBUILD); \
	printf 'Current: %s\nLatest:  %s\n' "$$current" "$$latest"; \
	[[ $@ != check-update && $$current != "$$latest" ]] || exit 0; \
	[[ $$(vercmp "$$latest" "$$current") == 1 ]] || { echo 'Refusing to downgrade' >&2; exit 1; }; \
	git diff --quiet && git diff --cached --quiet || { echo 'Commit or stash local changes first' >&2; exit 1; }; \
	work=$$(mktemp -d "$$PWD/.release.XXXXXX") || exit 1; \
	trap 'rm -rf -- "$$work"' EXIT; \
	trap 'exit 130' INT; trap 'exit 143' TERM HUP; \
	cp -- PKGBUILD Makefile kanata-switcher.install "$$work/" || exit 1; \
	( cd "$$work" || exit 1; \
	  sed --in-place -e "s/^pkgver=.*/pkgver=$$latest/" -e 's/^pkgrel=.*/pkgrel=1/' PKGBUILD || exit 1; \
	  SRCDEST="$$work" updpkgsums && env --unset=MAKEFLAGS make --no-print-directory lint srcinfo \
	) || exit 1; \
	mv -- "$$work/PKGBUILD" PKGBUILD && mv -- "$$work/.SRCINFO" .SRCINFO || exit 1; \
	git add -- PKGBUILD .SRCINFO && git commit --gpg-sign --message "feat: update to $$latest"

lint:
	@output=$$(namcap PKGBUILD) || exit 1; \
	printf '%s\n' "$$output"; \
	[[ $$output != *' E: '* ]]

srcinfo:
	@tmp=$$(mktemp "$$PWD/.SRCINFO.XXXXXX") || exit 1; \
	trap 'rm -f -- "$$tmp"' EXIT; \
	trap 'exit 130' INT; trap 'exit 143' TERM HUP; \
	makepkg --printsrcinfo > "$$tmp" && [[ -s $$tmp ]] && mv -- "$$tmp" .SRCINFO

# Intentionally no build: the maintainer tests through the normal AUR user flow.
publish: update lint
	git verify-commit HEAD
	git push origin HEAD:master

test:
	bash tests/release.sh
