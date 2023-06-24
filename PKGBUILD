# Maintainer: Wachid Adi Nugroho <wachidadinugroho.maya@gmail.com>

_pkgname=maui-agenda
pkgname=$_pkgname-git
pkgver=0.5.0.r0.g822eb2d
pkgrel=1
pkgdesc='Calendar application built with MauiKit'
url='https://invent.kde.org/maui/agenda'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
license=(LGPL3)
depends=(akonadi
         kcoreaddons
         ki18n
         mauikit-calendar
         mauikit
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
  install -Dm644 "${srcdir}/$_pkgname/licenses/"* -t "${pkgdir}/usr/share/licenses/$_pkgname"
}
