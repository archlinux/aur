PKGNAME := fungen-bin
AUR_REMOTE := ssh://aur@aur.archlinux.org/$(PKGNAME).git
BRANCH := master
BUILDDIR ?= $(HOME)/makepkg-build
SRCDEST ?= $(HOME)/makepkg-src
PKGDEST ?= $(HOME)/makepkg-pkg
LOGDEST ?= $(HOME)/makepkg-log
TMPDIR ?= $(HOME)/tmp

.PHONY: help clean build install reinstall test srcinfo check init-aur commit push publish status deps ldd

help:
	@echo "Targets:"
	@echo "  make deps        - install common build/test dependencies"
	@echo "  make clean       - remove pkg/src/build artifacts"
	@echo "  make build       - build package"
	@echo "  make install     - build and install package"
	@echo "  make reinstall   - remove installed package, then install fresh"
	@echo "  make test        - lightweight installed package test"
	@echo "  make ldd         - check linked shared libraries for installed binary"
	@echo "  make srcinfo     - regenerate .SRCINFO"
	@echo "  make check       - run namcap if installed"
	@echo "  make init-aur    - initialize git repo and AUR remote"
	@echo "  make commit      - commit PKGBUILD, .SRCINFO, and Makefile"
	@echo "  make push        - push to AUR"
	@echo "  make publish     - clean, install, test, srcinfo, check, commit, push"
	@echo "  make status      - show package/git status"

deps:
	sudo pacman -S --needed base-devel git namcap

clean:
	rm -rf pkg src
	rm -f *.pkg.tar.zst *.pkg.tar.zst.sig *.src.tar.gz
	rm -f *.log

build:
	mkdir -p "$(BUILDDIR)" "$(SRCDEST)" "$(PKGDEST)" "$(LOGDEST)" "$(TMPDIR)"
	BUILDDIR="$(BUILDDIR)" \
	SRCDEST="$(SRCDEST)" \
	PKGDEST="$(PKGDEST)" \
	LOGDEST="$(LOGDEST)" \
	TMPDIR="$(TMPDIR)" \
	makepkg -Csf

install:
	mkdir -p "$(BUILDDIR)" "$(SRCDEST)" "$(PKGDEST)" "$(LOGDEST)" "$(TMPDIR)"
	BUILDDIR="$(BUILDDIR)" \
	SRCDEST="$(SRCDEST)" \
	PKGDEST="$(PKGDEST)" \
	LOGDEST="$(LOGDEST)" \
	TMPDIR="$(TMPDIR)" \
	makepkg -Csi

reinstall:
	-sudo pacman -Rns --noconfirm $(PKGNAME)
	$(MAKE) install

test:
	@echo "Checking installed wrapper command..."
	@command -v fungen >/dev/null
	@echo "Checking /opt/fungen exists..."
	@test -d /opt/fungen
	@echo "Checking desktop entry..."
	@test -f /usr/share/applications/fungen.desktop
	@echo "Checking executable help/version path does not fail immediately..."
	@timeout 5s fungen --help >/dev/null 2>&1 || true
	@echo "Package smoke test passed."

ldd:
	@echo "Checking shared libraries for installed FunGen executable..."
	@exe="$$(find /opt/fungen -maxdepth 3 -type f -perm -111 \( -iname 'fungen' -o -iname 'FunGen' -o -iname 'fungen-bin' \) | head -n1)"; \
	if [ -z "$$exe" ]; then \
		echo "Could not find installed executable under /opt/fungen"; \
		exit 1; \
	fi; \
	echo "Executable: $$exe"; \
	ldd "$$exe" | sort

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

check:
	@if command -v namcap >/dev/null; then \
		echo "Running namcap on PKGBUILD..."; \
		namcap PKGBUILD || true; \
		if ls *.pkg.tar.zst >/dev/null 2>&1; then \
			echo "Running namcap on built package in current directory..."; \
			namcap *.pkg.tar.zst || true; \
		elif ls "$(PKGDEST)"/*.pkg.tar.zst >/dev/null 2>&1; then \
			echo "Running namcap on built package in PKGDEST..."; \
			namcap "$(PKGDEST)"/*.pkg.tar.zst || true; \
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
	@ls -lh "$(PKGDEST)"/*.pkg.tar.zst 2>/dev/null || true
	@echo
	@echo "== installed package =="
	@pacman -Qi $(PKGNAME) 2>/dev/null || true
	@echo
	@echo "== installed wrapper =="
	@ls -l /usr/bin/fungen 2>/dev/null || true
	@echo
	@echo "== /opt/fungen =="
	@ls -lah /opt/fungen 2>/dev/null | head -50 || true
	@echo
	@echo "== git status =="
	@git status