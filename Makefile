DOCKER ?= docker
IMAGE ?= archlinux:latest
MOUNT := -v "$(CURDIR)":/pkg -w /pkg

.PHONY: build install lint srcinfo shell clean

build:
	$(DOCKER) run --rm -it $(MOUNT) $(IMAGE) bash -lc 'set -euo pipefail; pacman -Syu --noconfirm; pacman -S --noconfirm --needed base-devel git zig pkgconf playerctl namcap pacman-contrib; useradd -m build; mkdir -p /pkg/{build,src,pkg}; chown -R build:build /pkg /home/build; su - build -c "export BUILDDIR=/pkg/build SRCDEST=/pkg/src PKGDEST=/pkg/pkg; cd /pkg; updpkgsums; makepkg -s --noconfirm; makepkg --printsrcinfo > .SRCINFO"'

install: build
	$(DOCKER) run --rm -it $(MOUNT) $(IMAGE) bash -lc 'set -euo pipefail; pacman -Syu --noconfirm; pacman -U --noconfirm /pkg/*.pkg.tar.zst; lrc_tty --help || true'

lint: build
	$(DOCKER) run --rm -it $(MOUNT) $(IMAGE) bash -lc 'set -euo pipefail; pacman -Syu --noconfirm; pacman -S --noconfirm --needed namcap; namcap /pkg/PKGBUILD || true; namcap /pkg/*.pkg.tar.zst || true'

srcinfo:
	$(DOCKER) run --rm -it $(MOUNT) $(IMAGE) bash -lc 'set -euo pipefail; pacman -Syu --noconfirm; pacman -S --noconfirm --needed base-devel git; useradd -m build; chown -R build:build /pkg /home/build; su - build -c "cd /pkg; makepkg --printsrcinfo > .SRCINFO"'

shell:
	$(DOCKER) run --rm -it $(MOUNT) $(IMAGE) bash

clean:
	rm -rf pkg src *.pkg.tar.* *.src.tar.* *.log

