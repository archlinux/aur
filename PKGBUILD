# Maintainer: Devin Bayer <dev@doubly.so>
pkgname=flatpak-xdg-utils-git
pkgver=1.0.1.r7.g4fdd2e2
pkgrel=1
pkgdesc="Utilities for containerized apps to launch programs outside the container"
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/flatpak/flatpak-xdg-utils"
license=('GPL')
depends=()
makedepends=()
source=('git+https://github.com/flatpak/flatpak-xdg-utils.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/flatpak-xdg-utils"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  meson --prefix /usr \
    --buildtype=plain \
    --bindir=/usr/libexec/flatpak-xdg-utils \
    -Dinstalled_tests=true \
    "$srcdir/flatpak-xdg-utils" build

  ninja -Cbuild
}

package() {
  DESTDIR="$pkgdir" ninja -Cbuild install
  mkdir -p $pkgdir/usr/bin
  ln -s /usr/libexec/flatpak-xdg-utils/flatpak-spawn $pkgdir/usr/bin/
}
