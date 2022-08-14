# Maintainer: Wachid Adi Nugroho <wachidadinugroho.maya@gmail.com>

pkgname=cask-server-git
_pkgname=${pkgname%-git}
pkgver=r3.e442424
pkgrel=1
pkgdesc='Public server and API to interface with Cask features'
url='https://github.com/Nitrux/cask-server'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
license=(GPL3)
depends=(qt5-base)
makedepends=(git extra-cmake-modules)
groups=(maui)
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cmake -B build -S $_pkgname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
