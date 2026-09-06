# Maintainer: broroeror <54515333+broroeror@users.noreply.github.com>
#
# AUR package for Deadband — a Linux game-controller configuration app (Qt/QML).
# Publish this to the AUR so Arch users can install with one command:
#
#     yay -S deadband-git
#
# This is a VCS (-git) package: it builds from the latest commit on the default
# branch, and pkgver() below derives the version from git, so no checksums or
# `updpkgsums` step is needed.
pkgname=deadband-git
pkgver=r62.c78beb8
pkgrel=1
pkgdesc="Configure game controller lighting, sticks, triggers and buttons on Linux"
arch=('any')
url="https://github.com/broroeror/gamesir-linux-tools"
license=('MIT')
# NOTE: the Qt binding is packaged as `pyside6`, NOT `python-pyside6` (which does
# not exist). A dev box with pyside6 already installed hides this -- it only shows
# up on a clean `makepkg` dependency check, i.e. on every user's first install.
depends=('python' 'pyside6' 'python-hidapi' 'libusb')
makedepends=('git')
provides=('deadband')
# Supersede the pre-rename package so an upgrade replaces it instead of leaving a
# second, now-broken launcher installed alongside.
conflicts=('deadband' 'gamesir-cyclone2-git' 'gamesir-cyclone2')
replaces=('gamesir-cyclone2-git' 'gamesir-cyclone2')
source=("$pkgname::git+${url}.git")                          # <-- VCS source
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  local share="$pkgdir/usr/share/deadband"

  # app core (vendor-neutral) + entry point. A GLOB, not a hand-kept list: the
  # list rotted when mouse_bridge.py/doctor.py were added, crashing every AUR
  # install at import (issue #4). We're packaging a fresh git clone, so the glob
  # sees only tracked files and can't pick up local-only cruft.
  install -d "$share"
  install -Dm644 ./*.py "$share"/
  rm -f "$share/smoke_test.py"                 # dev tool, not needed at runtime
  # per-vendor protocol packages (vendors/gamesir/..., incl. models/)
  cp -r vendors "$share"/
  find "$share/vendors" -name '__pycache__' -type d -prune -exec rm -rf {} +
  cp -r qml "$share"/
  install -d "$share/assets"
  # icon-*.png are the launcher art; glyph-pad*.png are the in-app themed logo mark
  # (two pre-tinted variants: light accents need the dark glyph -- see Theme.onAccent)
  install -Dm644 assets/icon.png assets/icon-64.png assets/icon-48.png \
                 assets/glyph-pad.png assets/glyph-pad-dark.png "$share"/assets/

  # launcher
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/deadband" <<'EOF'
#!/usr/bin/env bash
exec python3 /usr/share/deadband/deadband.py "$@"
EOF
  chmod 755 "$pkgdir/usr/bin/deadband"

  # licence: MIT is not one of Arch's "common" licences, so the package must ship
  # its own copy under /usr/share/licenses/<pkgname>/
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # udev rules (vendor-scoped uaccess; no replug needed after trigger) — the
  # controller's, and the Logitech mouse's for the G502 X pages
  install -Dm644 70-gamesir.rules "$pkgdir/usr/lib/udev/rules.d/70-gamesir.rules"
  install -Dm644 packaging/udev/70-deadband-g502x.rules \
    "$pkgdir/usr/lib/udev/rules.d/70-deadband-g502x.rules"

  # desktop entry + icons
  install -Dm644 packaging/deadband.desktop \
    "$pkgdir/usr/share/applications/deadband.desktop"
  for sz in 48 64 128; do
    install -Dm644 "assets/icon-${sz}.png" \
      "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps/deadband.png"
  done
  install -Dm644 assets/icon.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/deadband.png"
}
