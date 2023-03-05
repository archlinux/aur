# Maintainer: Wachid Adi Nugroho <wachidadinugroho.maya@gmail.com>

_pkgname=maui-station
pkgname=$_pkgname-git
pkgver=2.2.2.r2.g83a1764
pkgrel=3
pkgdesc='Convergent terminal emulator.'
url='https://invent.kde.org/maui/station'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
license=(GPL3)
depends=(kconfig
         kcoreaddons
         ki18n
         mauikit-terminal
         qt5-base
         qt5-declarative)
makedepends=(git extra-cmake-modules)
groups=(maui)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
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
