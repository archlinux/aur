# Maintainer: Sanjaya Danushka <dsanjaya712@gmail.com>
pkgname=neoarch-git
pkgver=1.0.beta.1.r0.g0000000
pkgrel=1
pkgdesc="NeoArch Package Manager for Arch Linux"
arch=('any')
url="https://github.com/Sanjaya-Danushka/Aurora"
license=('custom')
depends=('python-pyqt6' 'python-requests' 'qt6-svg' 'git' 'flatpak' 'nodejs' 'npm')
makedepends=('git')
provides=('neoarch')
conflicts=('neoarch')
source=('git+https://github.com/Sanjaya-Danushka/Aurora.git')
md5sums=('SKIP')

pkgver() {
  cd Aurora
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir"
  # Install to /opt/neoarch
  install -d "$pkgdir/opt/neoarch"
  cp -r Aurora "$pkgdir/opt/neoarch/"
  # Make scripts executable
  chmod +x "$pkgdir/opt/neoarch/Aurora/install_arch_deps.sh"
  chmod +x "$pkgdir/opt/neoarch/Aurora/bin/neoarch.sh"
  chmod +x "$pkgdir/opt/neoarch/Aurora/install_desktop_entry.sh"
  # Install desktop file
  install -Dm644 "$pkgdir/opt/neoarch/Aurora/aurora.desktop" "$pkgdir/usr/share/applications/neoarch.desktop"
  sed -i 's|/home/test/New Folder/Aurora|/opt/neoarch/Aurora|g' "$pkgdir/usr/share/applications/neoarch.desktop"
  # Install icon
  install -Dm644 "$pkgdir/opt/neoarch/Aurora/assets/icons/discover/logo1.png" "$pkgdir/usr/share/pixmaps/neoarch.png"
}

post_install() {
  if command -v flatpak >/dev/null 2>&1; then
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo || true
  fi
}
