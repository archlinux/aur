# Maintainer: Wachid Adi Nugroho <wachidadinugroho.maya@gmail.com>

_pkgname=mauikit-documents
pkgname=$_pkgname-git
pkgver=4.0.0.alpha.20240502
pkgrel=1
pkgdesc='MauiKit Documents components'
url='https://invent.kde.org/maui/mauikit-documents'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
license=(BSD-2-Clause custom:CC0 LGPL)
depends=(karchive
         kconfig
         kcoreaddons
         kguiaddons
         kfilemetadata
         kiconthemes
         kio
         ki18n
         mauikit-git
         poppler-qt6
         qt6-base
         qt6-declarative
         qt6-quickcontrols2
         zlib)
makedepends=(git extra-cmake-modules)
groups=(maui)
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+$url.git#branch=qt6)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  if git tag | grep v4
  then
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
  else
    echo "4.0.0.alpha.`date "+%Y%m%d"`"
  fi
}

build() {
  cmake -B build -S $_pkgname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_WITH_QT6=ON -Wno-dev \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $_pkgname/LICENSES/* -t "${pkgdir}"/usr/share/licenses/$_pkgname
}
