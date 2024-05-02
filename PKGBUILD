# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >
# Co-maintainer: Wachid Adi Nugroho <wachidadinugroho.maya@gmail.com>

_pkgname=mauikit-texteditor
pkgname=$_pkgname-git
pkgver=4.0.0.alpha.20240502
pkgrel=1
pkgdesc="MauiKit Text Editor components"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/maui/mauikit-texteditor"
license=(BSD-2-Clause custom:CC0 LGPL)
groups=(maui)
depends=(mauikit-git ki18n kcoreaddons syntax-highlighting)
makedepends=(git extra-cmake-modules)
provides=($_pkgname)
conflicts=($_pkgname)
source=(git+$url.git)
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
  cmake -B build -S $_pkgname -Wno-dev \
    -DBUILD_WITH_QT6=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
  cmake --build build --config RelWithDebInfo
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config RelWithDebInfo
  install -Dm644 $_pkgname/LICENSES/* -t "${pkgdir}"/usr/share/licenses/$_pkgname
}
