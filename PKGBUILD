# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-rendering8
pkgver=8.2.2
pkgrel=4
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="C++ library designed to provide an abstraction for different rendering engines."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'freeimage'
  'gz-common=5'
  'gz-math=7'
  'gz-plugin=2'
  'gz-utils=2'
  'ogre-next2'
  )
makedepends=(
  'cmake'
  'boost'
  'doxygen'
  'gz-cmake=3'
  'vulkan-headers'
  )
optdepends=(
  'optix: Nvidia OptiX rendering engine plugin'
  'ogre-1.9: Ogre 1.x rendering enging plugin'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz"
        "https://github.com/gazebosim/${_pkgbase}/pull/1128.patch")
sha256sums=('e223a71b5755230cb529c6810e066c4cc694432444ecc648db92bd28838d3367'
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
           -DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname" \
           -DBUILD_TESTING=OFF \
           -DUSE_UNOFFICIAL_OGRE_VERSIONS=ON \
           -Wno-dev
  cmake --build .
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/$_build_dir"
}
