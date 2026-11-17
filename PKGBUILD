# Maintainer: oysstu <oysstu at gmail dot com>

pkgname=gz-math9
pkgver=9.3.0
pkgrel=2
_pkgmaj=${pkgver%%.*}
_pkgbase=${pkgname::-${#_pkgmaj}}
pkgdesc="General purpose math library for robot applications."
arch=('any')
url="https://github.com/gazebosim/${_pkgbase}"
license=('Apache-2.0')
depends=(
  'eigen'
  'gz-utils=4'
  )
makedepends=(
  'cmake'
  'doxygen'
  'gz-cmake=5'
  'pybind11'
  'python'
  'ruby'
  'swig'
  )
provides=("${_pkgbase}=${_pkgmaj}")
conflicts=("${_pkgbase}")   # Ruby bindings are unversioned and conflicts (ruby/gz/math.so)
source=("https://github.com/gazebosim/${_pkgbase}/archive/${pkgname}_${pkgver}.tar.gz"
        "https://github.com/gazebosim/gz-math/pull/850.patch")
sha256sums=('9e957d024a8ce7a94dfb4a33f6425077b33526a0f0e2385ae93c25f88ff8cfb7'
            'fcca5ed26054a998a5c7d760e8fe6c51b91dd4525427d964426ed97a2c20ec9c')

prepare() {
  cd "${_pkgbase}-${pkgname}_${pkgver}"
  patch -p1 < ${srcdir}/850.patch

}

build() {
  cmake -B build -S "${_pkgbase}-${pkgname}_${pkgver}" \
           -DCMAKE_BUILD_TYPE='None' \
           -DCMAKE_INSTALL_PREFIX='/usr' \
           -DCMAKE_INSTALL_LIBEXECDIR="lib/$pkgname" \
           -DBUILD_TESTING=OFF \
           -DUSE_SYSTEM_PATHS_FOR_PYTHON_INSTALLATION:BOOL=ON \
           -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
