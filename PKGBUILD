# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>

_Name="Imath"
_name="${_Name,,}"
pkgname="lib32-${_name}"
pkgver=3.1.12
_api="${pkgver%.*}"
pkgrel=1
pkgdesc="A C++ and python library of 2D and 3D vector, matrix, and math operations for computer graphics (32-bit)"
arch=('x86_64')
url="https://www.openexr.com"
_url="https://github.com/AcademySoftwareFoundation/${_Name}"
license=('BSD-3-Clause')
depends=("${_name}>=${pkgver}" 'lib32-gcc-libs' 'lib32-glibc')
makedepends=('cmake>=3.12')
provides=("lib${_Name}-${_api//./_}.so")
_pkgsrc="${_Name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8a1bc258f3149b5729c2f4f8ffd337c0e57f09096e4ba9784329f40c4a9035da')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -Wno-dev
    -DCMAKE_BUILD_TYPE:STRING='None'
    -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib32'
    -DPYTHON:BOOL=OFF
    -DBUILD_WEBSITE:BOOL=OFF
    -DBUILD_TESTING:BOOL=ON
  )
  
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

check() {
  local excluded_tests="Imath.testBoxAlgo|Imath.testBox|Imath.testFrustum"
  local ctest_flags=(
    --test-dir "${_pkgsrc}/build"
    --output-on-failure
    --parallel $(nproc)
    --exclude-regex "${excluded_tests}"
  )

  cd "${srcdir}"
  ctest "${ctest_flags[@]}"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
