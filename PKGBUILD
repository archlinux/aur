# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-launch8
pkgver=8.0.1
pkgrel=3
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Run and manage programs and plugins."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'gz-common=6'
  'gz-gui=9'
  'gz-math=8'
  'gz-msgs=11'
  'gz-plugin=3'
  'gz-sim=9'
  'gz-transport=14'
  'gz-utils=3'
  'qt5-base'
  'qt5-quickcontrols2'
  'tinyxml2'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=4'
  'libwebsockets'
  )
optdepends=(
  'libwebsockets: a websocket server for simulation'
)
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz"
        "https://github.com/gazebosim/${_pkgbase}/pull/295.patch")
sha256sums=('a6a6002cc904abbb9233510fc661b5a599d4eb3908783bc6da56070b30cd69bb'
            '37069d666f130bc75339bb3568ae9668debac3997bd6857773087b888f049d7a')

prepare() {
  cd "${_pkgbase}-${pkgname}_${pkgver}"
  patch -p1 < ${srcdir}/295.patch
}

build() {
  cmake -B build -S "${_pkgbase}-${pkgname}_${pkgver}" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname" \
           -DBUILD_TESTING=OFF \
           -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
