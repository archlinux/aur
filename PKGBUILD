# Maintainer: Cedric Girard <girard.cedric@gmail.com>

pkgname=wlay-git
pkgver=r21.7018252
pkgrel=2
pkgdesc="Graphical output management for Wayland"

arch=('i686' 'x86_64')
url="https://github.com/atx/wlay"
license=('MIT')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'wayland' 'glfw-wayland' 'libepoxy')
depends=('wayland' 'glfw-wayland' 'libepoxy')
provides=('wlay')
conflicts=('wlay')
source=('wlay::git+https://github.com/atx/wlay.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/wlay
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare(){
  cd "$srcdir"/wlay
  git submodule init
  git submodule update
}

build() {
  cd "$srcdir"/wlay
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir"/wlay
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
