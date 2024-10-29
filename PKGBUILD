# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-transport13
pkgver=13.4.0
pkgrel=2
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Transport library for component communication based on publication/subscription and service calls."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache')
depends=(
  'cppzmq'
  'gz-msgs=10'
  'gz-utils=2'
  'protobuf-c'
  'protobuf'
  'zeromq'
)
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=3'
  'pybind11'
  'util-linux-libs'  # uuid
  )
provides=("${_pkgbase}=${_pkgmaj}")
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz"
	"protobuf28.patch")
sha256sums=('7c9d7bc46b2d8abb81487be346cafe56b482873019110e39a7b65adb4cbc8514'
	    'SKIP')

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
