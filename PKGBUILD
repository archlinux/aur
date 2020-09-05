# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com > 

pkgname=kquickimageeditor-git
pkgver=r19.78923f4
pkgrel=1
pkgdesc="Image editing components"
arch=('x86_64')
url="https://invent.kde.org/libraries/kquickimageeditor"
license=('GPL3')
depends=('qt5-base' 'qt5-declarative')
makedepends=('git' 'extra-cmake-modules')
provides=('kquickimageeditor')
conflicts=('kquickimageeditor')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${pkgname%-git}"
  mkdir build
}

build() {
  cd "${pkgname%-git}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}
 
package() {
  cd "${pkgname%-git}/build"
  make DESTDIR="$pkgdir" install
}