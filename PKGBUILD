# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-rendering9
pkgver=9.1.0
pkgrel=3
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="C++ library designed to provide an abstraction for different rendering engines."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'freeimage'
  'gz-common=6'
  'gz-math=8'
  'gz-plugin=3'
  'gz-utils=3'
  'ogre-next'
  )
makedepends=(
  'cmake'
  'boost'
  'doxygen'
  'gz-cmake=4'
  'vulkan-headers'
  )
optdepends=(
  'optix: Nvidia OptiX rendering engine plugin'
  'ogre-1.9: Ogre 1.x rendering enging plugin'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz"
        "https://github.com/gazebosim/${_pkgbase}/pull/1128.patch")
sha256sums=('3f86a88384e062725d3388476fcd35cc01cdb24ad9c15248ebefeff3699bdffd'
            '2c9939d6d5eeb4b669267d09266e45a7dc0d387bf3e1b01510acc5090a6be92d')

_build_dir="${_pkgbase}-${pkgname}_${pkgver}/build"

prepare() {
  cd "${_pkgbase}-${pkgname}_${pkgver}"
  patch -p1 < ${srcdir}/1128.patch
}

build() {
  mkdir -p "$srcdir/$_build_dir" && cd $_
  cmake .. -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DBUILD_TESTING=OFF \
           -Wno-dev
  cmake --build .
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/$_build_dir"
}
