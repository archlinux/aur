# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="woff2"
pkgname="lib32-${_name}"
pkgver=1.0.2
pkgrel=1
pkgdesc="Web Open Font Format 2 reference implementation (32-bit)"
arch=('x86_64')
url="https://github.com/google/${_name}"
license=('MIT')
depends=('lib32-brotli' 'lib32-gcc-libs' 'lib32-glibc' "${_name}>=${pkgver}")
makedepends=('cmake>=2.8.6')
provides=("lib${_name}"{common,dec,enc}'.so')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('add272bb09e6384a4833ffca4896350fdb16e0ca22df68c0384773c67a175594')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -e '/set(CMAKE_C_FLAGS/d' \
      -e '/set(CMAKE_CXX_FLAGS/d' \
      -e '/RPATH/d' \
      -e '/woff2_decompress/d' \
      -e '/woff2_compress/d' \
      -e '/woff2_info/d' \
      -e '/convert_woff2ttf_fuzzer/d' \
      -e '/convert_woff2ttf_fuzzer_new_entry/d' \
      -i 'CMakeLists.txt'
}

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
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  )
  
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

# check() {
#   local excluded_tests=""
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
