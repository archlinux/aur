# Maintainer: isleap
pkgname=akari-tool
pkgver=0.3.2
pkgrel=1
pkgdesc="Gaming setup tool for vanilla Arch — dependencies, drivers, kernels & diagnosis"
arch=('any')
url="https://github.com/isleap9/Akari-Tool-Arch"
license=('GPL-3.0-or-later')
depends=('python' 'pyside6' 'bash' 'polkit' 'pciutils' 'curl')
optdepends=(
  'paru: AUR extras (Heroic, ProtonUp-Qt, GOverlay, linux-cachyos)'
  'yay: AUR extras (alternative helper)'
  'flatpak: AUR-free app installs via Flathub'
  'snapper: pre-change snapshots on btrfs'
  'timeshift: pre-change snapshots (alternative)'
  'reflector: mirror optimization'
  'pacman-contrib: package cache cleanup'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0749b346b97d4d6b4d3d22171fee275a64ac3f1368d35162d8b6618f1f984cd8')

package() {
  cd "Akari-Tool-Arch-$pkgver"

  # application tree
  install -dm755 "$pkgdir/usr/share/$pkgname"
  cp -r akari ui backend main.py "$pkgdir/usr/share/$pkgname/"
  chmod 755 "$pkgdir/usr/share/$pkgname/backend/akari-setup.sh"

  # launcher
  install -dm755 "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/akari-tool" << 'LAUNCHER'
#!/bin/sh
exec python /usr/share/akari-tool/main.py "$@"
LAUNCHER
  chmod 755 "$pkgdir/usr/bin/akari-tool"

  # desktop entry + icon
  install -Dm644 packaging/akari-tool.desktop \
    "$pkgdir/usr/share/applications/akari-tool.desktop"
  install -Dm644 packaging/akari-tool.png \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/akari-tool.png"
}
