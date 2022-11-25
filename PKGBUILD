# Maintainer: Wachid Adi Nugroho <wachidadinugroho.maya@gmail.com>

_pkgname=maui-core
pkgname=$_pkgname-git
pkgver=0.5.6.r0.gb298165
pkgrel=1
pkgdesc='Core libraries to manage the DE to be shared between Maui Settings and Cask.'
url='https://github.com/Nitrux/maui-core'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
license=(GPL3)
depends=(kcoreaddons
         ki18n
         kidletime
         kservice
         libcanberra
         qt5-base
         qt5-declarative
         solid
         sound-theme-freedesktop)
makedepends=(git extra-cmake-modules)
groups=(maui)
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+$url.git)
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
