# Maintainer: Wachid Adi Nugroho <wachidadinugroho.maya@gmail.com>

_pkgname=mauikit-calendar
pkgname=$_pkgname-git
pkgver=4.0.1.r7.g731a1f6
pkgrel=1
pkgdesc='MauiKit Calendar components'
url='https://invent.kde.org/maui/mauikit-calendar'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
license=(LGPL3)
depends=(akonadi-contacts
         calendarsupport
         eventviews
         kconfig
         kcoreaddons
         ki18n
         libakonadi
         mauikit-git
         qt6-base
         qt6-declarative
         qt6-svg)
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
  install -Dm644 "${srcdir}/$_pkgname/licenses/"* -t "${pkgdir}/usr/share/licenses/$_pkgname"
}
