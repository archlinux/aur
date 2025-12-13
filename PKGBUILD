# Maintainer: Doodcom <doodcom@users.noreply.github.com>

pkgname=doodcom-safe-updater
pkgver=0.5.8
pkgrel=1
pkgdesc="GUI-based safety-first updater for CachyOS / Arch Linux"
arch=('any')
url="https://github.com/Doodcom/DoodcomSafeUpdater"
license=('MIT')  # change if you use something else
depends=(
  'python'
  'pyside6'
  'pacman'
  'pacman-contrib'
  'polkit'
)
optdepends=(
  'snapper: Btrfs restore point support'
  'snap-pac: automatic pacman snapshots'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Doodcom/DoodcomSafeUpdater/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('df07c344e87e0a7f335dc33a6acb00831a3c979f589198316992a9429cbaa098')


package() {
  cd "$srcdir/DoodcomSafeUpdater-${pkgver}"

  # App code
  install -d "$pkgdir/usr/lib/doodcom-safe-updater"
  install -Dm755 safe_update_gui.py \
    "$pkgdir/usr/lib/doodcom-safe-updater/safe_update_gui.py"

  # Launcher
  install -Dm755 /dev/stdin \
    "$pkgdir/usr/bin/doodcom-safe-updater" <<'EOF'
#!/usr/bin/env bash
exec python3 /usr/lib/doodcom-safe-updater/safe_update_gui.py
EOF

  # Desktop entry
  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/applications/doodcom-safe-updater.desktop" <<'EOF'
[Desktop Entry]
Name=Doodcom’s Safe Updater
Comment=Safer updates for CachyOS / Arch Linux
Exec=doodcom-safe-updater
Icon=system-software-update
Terminal=false
Type=Application
Categories=System;Settings;
StartupNotify=true
EOF
}
