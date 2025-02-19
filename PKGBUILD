# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-transport14
pkgver=14.0.1
pkgrel=1
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Transport library for component communication based on publication/subscription and service calls."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
depends=(
  'cppzmq'
  'gz-msgs=11'
  'gz-utils=3'
  'protobuf-c'
  'protobuf'
  'zeromq'
)
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=4'
  'pybind11'
  'util-linux-libs'  # uuid
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz"
        "protobuf28.patch")
sha256sums=('ba6349c7a226b9669eb94d8a9586381bafa065ba9508263b722bad453fba0f4c'
            'e4b9df324953f2334962ca335e01c71db652c842b1ba444018fcd7a1759abf68')

_build_dir="${_pkgbase}-${pkgname}_${pkgver}/build"

prepare() {
 cd "${_pkgbase}-${pkgname}_${pkgver}"
 patch -p1 < "${srcdir}/protobuf28.patch"
}

build() {
  mkdir -p "$srcdir/$_build_dir" && cd $_
  cmake .. -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DBUILD_TESTING=OFF \
           -DUSE_SYSTEM_PATHS_FOR_PYTHON_INSTALLATION:BOOL=ON \
           -Wno-dev
  cmake --build .
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/$_build_dir"
}
