# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-launch7
pkgver=7.1.1
pkgrel=3
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Run and manage programs and plugins."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'gz-common=5'
  'gz-gui=8'
  'gz-math=7'
  'gz-msgs=10'
  'gz-plugin=2'
  'gz-sim=8'
  'gz-transport=13'
  'gz-utils=2'
  'qt5-base'
  'qt5-quickcontrols2'
  'tinyxml2'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  'libwebsockets'
  )
optdepends=(
  'libwebsockets: a websocket server for simulation'
)
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz"
        "https://github.com/gazebosim/${_pkgbase}/pull/295.patch")
sha256sums=('dba949260bf399514aaaff12e98806edeb18f89e11643e12b221caa06a7dc1e0'
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
