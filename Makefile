SHELL := /usr/bin/bash
.DEFAULT_GOAL := check-update
.NOTPARALLEL:
.PHONY: check-update update lint srcinfo publish test

# Shared shell commands leave current and latest available to the caller.
define CHECK_UPDATE
release=$$(curl --fail --silent --show-error --location --max-time 60 https://api.github.com/repos/7mind/kanata-switcher/releases/latest) || exit 1; \
latest=$$(jq --slurp --exit-status --raw-output 'select(length == 1) | .[0].tag_name | select(type == "string" and test("^v[0-9]+([.][0-9]+)+$$")) | ltrimstr("v")' <<< "$$release") || exit 1; \
current=$$(sed --quiet 's/^pkgver=//p' PKGBUILD); \
printf 'Current: %s\nLatest:  %s\n' "$$current" "$$latest"
endef

check-update:
	@$(CHECK_UPDATE)

update:
	@$(CHECK_UPDATE); \
	[[ $$current != "$$latest" ]] || exit 0; \
	[[ $$(vercmp "$$latest" "$$current") == 1 ]] || { echo 'Refusing to downgrade' >&2; exit 1; }; \
	git diff --cached --quiet && git diff --quiet -- . ':!PKGBUILD' ':!.SRCINFO' ':!Makefile' ':!update.sh' ':!kanata-switcher.install' && \
	[[ -z $$(git ls-files --others --exclude-standard) ]] || { echo 'Refusing pre-staged or unrelated changes' >&2; exit 1; }; \
	for file in PKGBUILD .SRCINFO Makefile update.sh kanata-switcher.install; do \
		[[ -f $$file && ! -L $$file ]] || { echo "Refusing missing or symlinked $$file" >&2; exit 1; }; \
	done; \
	bash update.sh "$$latest"

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
	git diff --quiet && git diff --cached --quiet && test -z "$$(git ls-files --others --exclude-standard)"
	git verify-commit HEAD
	git push origin HEAD:master

# Uncomment to test. No need to ship testing for the publishing process.
# test:
# 	bash tests/release.sh
