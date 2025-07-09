# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-transport13
pkgver=13.4.1
pkgrel=4
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="Transport library for component communication based on publication/subscription and service calls."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
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
        "https://github.com/gazebosim/${_pkgbase}/pull/587.patch"
        "https://github.com/gazebosim/${_pkgbase}/pull/619.patch")
sha256sums=('2aac8fcfd525091648f405738e95d5d8b55b87767e6cb74afde6390a5fe924c5'
            'da9d17e320d4fc53ffbb8f1973852dd9dbbde56b34fdcb5285e96b51fec3474b'
            '4909b335880fb152b82f00613c48e0c248319c16cbe821c659606b15b9e43787')

_build_dir="${_pkgbase}-${pkgname}_${pkgver}/build"

prepare() {
  cd "${_pkgbase}-${pkgname}_${pkgver}"
  patch -p1 < ${srcdir}/587.patch
  patch -p1 < ${srcdir}/619.patch
}

build() {
  mkdir -p "$srcdir/$_build_dir" && cd $_
  cmake .. -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname" \
           -DBUILD_TESTING=OFF \
           -DUSE_SYSTEM_PATHS_FOR_PYTHON_INSTALLATION:BOOL=ON \
           -Wno-dev
  cmake --build .
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/$_build_dir"
}
