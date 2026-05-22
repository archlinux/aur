PKGNAME := kokoro-tts
AUR_REMOTE := ssh://aur@aur.archlinux.org/$(PKGNAME).git
BRANCH := master
AUR_HELPER ?= $(shell command -v yay 2>/dev/null || command -v paru 2>/dev/null || true)
AUR_HELPER_FLAGS ?= --needed --noconfirm
BUILDDIR ?= $(HOME)/makepkg-build
PIP_CACHE_DIR ?= $(HOME)/pip-cache
TMPDIR ?= $(HOME)/tmp

.PHONY: help clean deps build install reinstall test srcinfo check init-aur commit push publish status

help:
	@echo "Targets:"
	@echo "  make clean       - remove pkg/src/build artifacts"
	@echo "  make deps        - install AUR/package dependencies needed by makepkg"
	@echo "  make build       - build package"
	@echo "  make install     - build and install package"
	@echo "  make reinstall   - remove installed package, then install fresh"
	@echo "  make test        - lightweight installed package test"
	@echo "  make srcinfo     - regenerate .SRCINFO"
	@echo "  make check       - run namcap if installed"
	@echo "  make init-aur    - initialize git repo and AUR remote"
	@echo "  make commit      - commit PKGBUILD, .SRCINFO, and Makefile"
	@echo "  make push        - push to AUR"
	@echo "  make publish     - clean, install, test, srcinfo, check, commit, push"
	@echo "  make status      - show package/git status"

clean:
	rm -rf pkg src
	rm -f *.pkg.tar.zst *.pkg.tar.zst.sig *.src.tar.gz
	rm -f *.log

deps:
	@if ! pacman -Q python312 >/dev/null 2>&1; then \
		if [ -z "$(AUR_HELPER)" ]; then \
			echo "python312 is required, but no AUR helper was found."; \
			echo "Install python312 manually, or install yay/paru and rerun make deps."; \
			exit 1; \
		fi; \
		echo "Installing AUR dependency python312 with $(AUR_HELPER)..."; \
		"$(AUR_HELPER)" -S $(AUR_HELPER_FLAGS) python312; \
	fi

build: deps
	makepkg -Csf

install: deps
	mkdir -p "$(BUILDDIR)" "$(PIP_CACHE_DIR)" "$(TMPDIR)"
	BUILDDIR="$(BUILDDIR)" \
	PIP_CACHE_DIR="$(PIP_CACHE_DIR)" \
	TMPDIR="$(TMPDIR)" \
	makepkg -Csi

reinstall:
	-sudo pacman -Rns --noconfirm $(PKGNAME)
	makepkg -Csi

test:
	@echo "Checking installed wrapper command..."
	@command -v kokoro-tts >/dev/null
	@echo "Checking Python package import..."
	@/opt/kokoro-tts/venv/bin/python -c "import kokoro_tts; print('kokoro_tts import ok')"
	@echo "Checking package version..."
	@/opt/kokoro-tts/venv/bin/python -c "import importlib.metadata; assert importlib.metadata.version('kokoro-tts') == '2.3.1'; print('kokoro-tts version ok')"
	@echo "Package smoke test passed."

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

check:
	@if command -v namcap >/dev/null; then \
		echo "Running namcap on PKGBUILD..."; \
		namcap PKGBUILD || true; \
		if ls *.pkg.tar.zst >/dev/null 2>&1; then \
			echo "Running namcap on built package..."; \
			namcap *.pkg.tar.zst || true; \
		else \
			echo "No built package found for namcap package check."; \
		fi; \
	else \
		echo "namcap not installed; skipping."; \
		echo "Install with: sudo pacman -S namcap"; \
	fi

init-aur:
	@if [ ! -d .git ]; then \
		git init; \
	fi
	@if ! git remote get-url origin >/dev/null 2>&1; then \
		git remote add origin $(AUR_REMOTE); \
	else \
		git remote set-url origin $(AUR_REMOTE); \
	fi
	@git branch -M $(BRANCH)
	@echo "AUR remote set to $(AUR_REMOTE)"

commit: srcinfo init-aur
	git add PKGBUILD .SRCINFO Makefile
	@if git diff --cached --quiet; then \
		echo "No changes to commit."; \
	else \
		git commit -m "Update $(PKGNAME)"; \
	fi

push:
	git push -u origin $(BRANCH)

publish: clean install test srcinfo check commit push

status:
	@echo "== package files =="
	@ls -lh *.pkg.tar.zst 2>/dev/null || true
	@echo
	@echo "== installed package =="
	@pacman -Qi $(PKGNAME) 2>/dev/null || true
	@echo
	@echo "== installed wrapper =="
	@ls -l /usr/bin/kokoro-tts 2>/dev/null || true
	@echo
	@echo "== git status =="
	@git status
