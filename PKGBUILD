# Maintainer: Sanjaya Danushka <dsanjaya712@gmail.com>
pkgname=neoarch
pkgver=3.1.3
pkgrel=1
pkgdesc="NeoArch Package Manager for Arch Linux (stable release, use 'neoarch-git' for latest dev builds)"
arch=('any')
url="https://github.com/Sanjaya-Danushka/Neoarch"
license=('MIT')
depends=('python-pyqt6' 'python-requests' 'python-keyring' 'qt6-svg' 'flatpak' 'nodejs' 'npm')
provides=('neoarch')
conflicts=('neoarch-git')
install=neoarch.install
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/Neoarch-$pkgver"
  # Install to /opt/neoarch/Neoarch (matching git package structure)
  install -d "$pkgdir/opt/neoarch/Neoarch"
  cp -r . "$pkgdir/opt/neoarch/Neoarch/"
  # Make scripts executable
  chmod +x "$pkgdir/opt/neoarch/Neoarch/scripts/install_arch_deps.sh"
  chmod +x "$pkgdir/opt/neoarch/Neoarch/bin/neoarch.sh"
  chmod +x "$pkgdir/opt/neoarch/Neoarch/scripts/install_desktop_entry.sh"
  # Fix entry point reference from aurora_home.py to -m neoarch
  sed -i 's|aurora_home.py|-m neoarch|' "$pkgdir/opt/neoarch/Neoarch/bin/neoarch.sh"
  # CLI on PATH (both the long and short name)
  install -d "$pkgdir/usr/bin"
  ln -s /opt/neoarch/Neoarch/bin/neoarch-cli "$pkgdir/usr/bin/neoarch-cli"
  ln -s /opt/neoarch/Neoarch/bin/neoarch-cli "$pkgdir/usr/bin/neo"
  # Install desktop file
  install -Dm644 "$pkgdir/opt/neoarch/Neoarch/packaging/aurora.desktop" "$pkgdir/usr/share/applications/neoarch.desktop"
  sed -i 's|/home/test/New Folder/Aurora|/opt/neoarch/Neoarch|g' "$pkgdir/usr/share/applications/neoarch.desktop"
  sed -i 's|Icon=.*|Icon=neoarch|' "$pkgdir/usr/share/applications/neoarch.desktop"
  # Install icon
  install -Dm644 "$pkgdir/opt/neoarch/Neoarch/assets/icons/app/icon.png" "$pkgdir/usr/share/pixmaps/neoarch.png"
  # Install license
  install -Dm644 "$pkgdir/opt/neoarch/Neoarch/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
