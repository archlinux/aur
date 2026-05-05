PKGNAME := f5-tts
AUR_REMOTE := ssh://aur@aur.archlinux.org/$(PKGNAME).git
BRANCH := master
TORCH_BACKEND ?= cuda
BUILDDIR ?= $(HOME)/makepkg-build
PIP_CACHE_DIR ?= $(HOME)/pip-cache
TMPDIR ?= $(HOME)/tmp

.PHONY: help clean build install reinstall test srcinfo check init-aur commit push publish status

help:
	@echo "Targets:"
	@echo "  make clean       - remove pkg/src/build artifacts"
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

build:
	makepkg -Csf



install:
	mkdir -p "$(BUILDDIR)" "$(PIP_CACHE_DIR)" "$(TMPDIR)"
	BUILDDIR="$(BUILDDIR)" \
	PIP_CACHE_DIR="$(PIP_CACHE_DIR)" \
	TMPDIR="$(TMPDIR)" \
	F5_TTS_TORCH_BACKEND="$(TORCH_BACKEND)" \
	makepkg -Csi

reinstall:
	-sudo pacman -Rns --noconfirm $(PKGNAME)
	makepkg -Csi

test:
	@echo "Checking installed wrapper commands..."
	@command -v f5-tts_infer-cli >/dev/null
	@command -v f5-tts_infer-gradio >/dev/null
	@command -v f5-tts_finetune-cli >/dev/null
	@command -v f5-tts_finetune-gradio >/dev/null
	@echo "Checking Python package import..."
	@/opt/f5-tts/venv/bin/python -c "import f5_tts; print('f5_tts import ok')"
	@echo "Checking patched Gradio cache path..."
	@/opt/f5-tts/venv/bin/python -c "from pathlib import Path; matches=list(Path('/opt/f5-tts/venv/lib').glob('python*/site-packages/f5_tts/infer/infer_gradio.py')); assert matches, 'infer_gradio.py not found'; text=matches[0].read_text(); assert 'XDG_CACHE_HOME' in text, 'infer_gradio.py does not appear to be patched for XDG_CACHE_HOME'; print('cache patch ok')"
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
	@echo "== installed wrappers =="
	@ls -l /usr/bin/f5-tts_* 2>/dev/null || true
	@echo
	@echo "== git status =="
	@git status
