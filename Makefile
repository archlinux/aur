DOCKER ?= docker
IMAGE ?= archlinux:latest
MOUNT := -v "$(CURDIR)":/pkg -w /pkg

ARTIFACT_DIR := /pkg/artifacts

.PHONY: build install lint srcinfo shell clean pull

# a stale image means pacman -Syu fails on an outdated keyring
pull:
	$(DOCKER) pull $(IMAGE)

build: pull
	$(DOCKER) run --rm -it $(MOUNT) $(IMAGE) bash -lc '\
	  set -euo pipefail; \
	  pacman -Syu --noconfirm; \
	  pacman -S --noconfirm --needed base-devel git zig pkgconf playerctl namcap pacman-contrib gnupg; \
	  useradd -m build || true; \
	  mkdir -p /pkg/build /pkg/src $(ARTIFACT_DIR); \
	  chown -R build:build /pkg /home/build; \
	  su - build -c "\
	    set -euo pipefail; \
	    export BUILDDIR=/pkg/build SRCDEST=/pkg/src PKGDEST=$(ARTIFACT_DIR); \
	    cd /pkg; \
   	    updpkgsums; \
	    makepkg -sf --noconfirm; \
	    makepkg --printsrcinfo > .SRCINFO; \
	    echo Built artifacts:; ls -lah $(ARTIFACT_DIR) || true" \
	'

install: build
	$(DOCKER) run --rm -it $(MOUNT) $(IMAGE) bash -lc '\
	  set -euo pipefail; \
	  pacman -Syu --noconfirm; \
	  pacman -S --noconfirm --needed gnupg archlinux-keyring; \
	  pacman-key --init; \
	  pacman-key --populate archlinux; \
	  pkg=$$(ls -1t $(ARTIFACT_DIR)/*.pkg.tar.zst 2>/dev/null | head -n1); \
	  if [ -z "$$pkg" ]; then \
	    echo "No built package found in $(ARTIFACT_DIR). Run \`make build\`."; \
	    exit 1; \
	  fi; \
	  echo Installing: $$pkg; \
	  pacman -U --noconfirm "$$pkg"; \
	  lrc_tty --help || true \
	'

lint: build
	$(DOCKER) run --rm -it $(MOUNT) $(IMAGE) bash -lc '\
	  set -euo pipefail; \
	  pacman -Syu --noconfirm; \
	  pacman -S --noconfirm --needed namcap; \
	  namcap /pkg/PKGBUILD || true; \
	  pkg=$$(ls -1t $(ARTIFACT_DIR)/*.pkg.tar.zst 2>/dev/null | head -n1); \
	  if [ -n "$$pkg" ]; then echo "Linting: $$pkg"; namcap "$$pkg" || true; else echo "No package to lint"; fi \
	'

srcinfo:
	$(DOCKER) run --rm -it $(MOUNT) $(IMAGE) bash -lc '\
	  set -euo pipefail; \
	  pacman -Syu --noconfirm; \
	  pacman -S --noconfirm --needed base-devel git; \
	  useradd -m build || true; \
	  chown -R build:build /pkg /home/build; \
	  su - build -c "cd /pkg; makepkg --printsrcinfo > .SRCINFO" \
	'

shell:
	$(DOCKER) run --rm -it $(MOUNT) $(IMAGE) bash

clean:
	rm -rf build src artifacts *.pkg.tar.* *.src.tar.* *.log

