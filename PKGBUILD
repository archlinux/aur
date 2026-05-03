# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-common5
pkgver=5.8.0
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Gazebo Common, a component of Gazebo, provides a set of libraries that cover many different use cases."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'assimp'
  'ffmpeg'
  'freeimage'
  'gdal'
  'glibc'  # libdl
  'gts'
  'gz-math=7'
  'gz-utils=2'
  'tinyxml2'
  'util-linux-libs' # uuid
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz"
        "https://github.com/gazebosim/${_pkgbase}/pull/672.patch")
sha256sums=('777503f584f8691bfb62826ecb5a7a6d42571822a446916a17729e229e0004cf'
            '923fb973b93b0e71f814bf499ddf29d6412a82d4ba768eeb3efaefcaea1d9fff')

prepare() {
  cd "${_pkgbase}-${pkgname}_${pkgver}"
  patch -p1 < ${srcdir}/672.patch
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
