# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="verdict"
pkgname="lib32-${_name}"
pkgver=1.4.4
pkgrel=1
pkgdesc="Compute quality functions of 2 and 3-dimensional regions (32-bit)"
arch=('x86_64')
url="https://github.com/sandialabs/${_name}"
license=('BSD-3-Clause')
depends=('lib32-glibc' "${_name}>=${pkgver}")
makedepends=('cmake>=3.16' 'lib32-gcc-libs' 'lib32-gtest')
provides=("lib${_name}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d12d1cd41c6568997df348a72cc2973a662fae1b3634a068ea2201b5f7383186')

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
    -DBUILD_SHARED_LIBS:BOOL=ON
    -DVERDICT_BUILD_DOC:BOOL=OFF
    -DVERDICT_ENABLE_TESTING:BOOL=ON
  )
  
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

check() {
  local excluded_tests=""
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
