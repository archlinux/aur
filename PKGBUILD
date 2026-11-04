# Maintainer: Sanjaya Danushka <neoarch.app@gmail.com>
pkgname=neoarch
pkgver=3.7.0
pkgrel=1
pkgdesc="NeoArch Package Manager for Arch Linux (stable release; use 'neoarch-git' for beta builds)"
arch=('any')
url="https://github.com/sanjayadanushka712/Neoarch"
license=('GPL-3.0-or-later')
# Core runtime — the app cannot work without these
depends=('python-pyqt6' 'python-requests' 'python-keyring' 'python-defusedxml' 'qt6-svg' 'git')
# Optional integrations — features degrade gracefully if absent
optdepends=('flatpak: Flatpak installs and updates'
            'nodejs: Discover page (npm)'
            'npm: Discover page (npm)')
provides=('neoarch')
conflicts=('neoarch-git')
install=neoarch.install
source=("$url/archive/refs/tags/$pkgver.tar.gz")
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
  # GUI on PATH as `neoarch`, CLI as `neoarch-cli` and the short `neo`
  install -d "$pkgdir/usr/bin"
  ln -s /opt/neoarch/Neoarch/bin/neoarch.sh "$pkgdir/usr/bin/neoarch"
  ln -s /opt/neoarch/Neoarch/bin/neoarch-cli "$pkgdir/usr/bin/neoarch-cli"
  ln -s /opt/neoarch/Neoarch/bin/neoarch-cli "$pkgdir/usr/bin/neo"
  # Install desktop file
  install -Dm644 "$pkgdir/opt/neoarch/Neoarch/packaging/io.github.sanjayadanushka712.NeoArch.desktop" "$pkgdir/usr/share/applications/neoarch.desktop"
  # Install icon
  install -Dm644 "$pkgdir/opt/neoarch/Neoarch/assets/icons/app/icon.png" "$pkgdir/usr/share/pixmaps/neoarch.png"
  # Install license
  install -Dm644 "$pkgdir/opt/neoarch/Neoarch/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
