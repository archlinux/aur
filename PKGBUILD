# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="libdeflate"
pkgname="lib32-${_name}"
pkgver=1.23
pkgrel=1
pkgdesc="Heavily optimized library for DEFLATE/zlib/gzip compression and decompression (32-bit)"
arch=('x86_64')
url="https://github.com/ebiggers/${_name}"
license=('MIT')
depends=('lib32-glibc' "${_name}>=${pkgver}")
makedepends=('cmake>=3.10' 'lib32-gcc-libs')
provides=("${_name}.so")
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('6921aaf0fde3a2c1a8b04484879c64c2da2ee499353927fa20e8816932a4ccdc53af302f978eb099ee01f1a4c2ac5184529886d1c2a7adcb388ddd9fbd2b078f')

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
    -DLIBDEFLATE_BUILD_STATIC_LIB:BOOL=OFF
    -DLIBDEFLATE_BUILD_GZIP:BOOL=OFF
    -DLIBDEFLATE_BUILD_TESTS:BOOL=OFF
  )
  
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

# check() {
#   local excluded_tests="test_partitioner"
#   local ctest_flags=(
#     --test-dir "${_pkgsrc}/build"
#     --output-on-failure
#     --parallel $(nproc)
#     --exclude-regex "${excluded_tests}"
#   )
# 
#   cd "${srcdir}"
#   ctest "${ctest_flags[@]}"
# }

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
