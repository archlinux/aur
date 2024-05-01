# Maintainer: Wachid Adi Nugroho <wachidadinugroho.maya@gmail.com>
# Contributor: Gustavo Castro < gustawho [ at ] gmail [ dot ] com >

_pkgname=mauikit-accounts
pkgname=$_pkgname-git
pkgver=4.0.0.alpha.20240502
pkgrel=1
pkgdesc="MauiKit utilities to handle User Accounts"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://invent.kde.org/maui/mauikit-accounts"
license=(BSD-2-Clause custom:CC0 LGPL)
groups=(maui)
depends=(qt6-base kcoreaddons ki18n mauikit-git)
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
    git describe --long --tags --first-parent --match 'v[0-9][0-9.][0-9.]*' | \
      sed 's=^v==;s=^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)=\1\2=;s=\([0-9]\+-g\)=r\1=;s=-=.=g'
  )
  else
    echo "4.0.0.alpha.`date "+%Y%m%d"`"
  fi
}

build() {
  cmake -B build -S $_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DBUILD_WITH_QT6=ON
  cmake --build build --config RelWithDebInfo
}

package() {
  DESTDIR="${pkgdir}" cmake --install build --config RelWithDebInfo
  install -Dm644 $_pkgname/LICENSES/* -t "${pkgdir}"/usr/share/licenses/$_pkgname
}
