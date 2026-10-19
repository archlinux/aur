# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="snappy"
pkgname="lib32-${_name}"
pkgver=1.3.1
pkgrel=1
pkgdesc="A fast compressor/decompressor library (32-bit)"
arch=(
  'x86_64'
)
url="https://github.com/google/${_name}"
license=(
  'BSD-3-Clause'
)
depends=(
  "${_name}>=${pkgver}"
  'lib32-gcc-libs'
  'lib32-glibc'
)
makedepends=(
  # 'clang'
  'cmake'
  'lib32-gtest'
)
checkdepends=(
  # 'lib32-zlib'
)
provides=(
  "lib${_name}.so"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz"
  "${_name}.pc.in"
  "${_name}-cmake_add_pkgconfig.patch"
  "${_name}-use_system_gtest.patch"
  "${_name}-reenable_rtti.patch"
)
sha256sums=('893f708a0bf4b5529d555ffcee390e940e932fcf90261f682604475a76cd0247'
            '134f06ca0584a1026538d0fb972fc141c008390ecae1806184b721eca1abbc75'
            '2a204d7d35509ffc290d80c641fcb7e8488c67ca550aa1695493cff12c53156b'
            '50b31b45511e8907f1319305c102f37631b0fbe509f862b612e70073383658e4'
            '2603862dc3ab4c57509a1892151959495571f841a24527118a88e366b11a3d73')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  cp -v "${srcdir}/${_name}.pc.in" .
  sed -e 's|/lib|/lib32|g' \
      -i "${_name}.pc.in"

  patch -Np1 -i "${srcdir}/${_name}-cmake_add_pkgconfig.patch" # https://bugs.archlinux.org/task/71246
  patch -Np1 -i "${srcdir}/${_name}-use_system_gtest.patch"
  patch -Np1 -i "${srcdir}/${_name}-reenable_rtti.patch"
}


build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_INSTALL_LIBDIR:PATH='lib32'
    -D CMAKE_CXX_STANDARD=23
    -D BUILD_SHARED_LIBS:BOOL=ON
    -D SNAPPY_BUILD_TESTS:BOOL=OFF
    -D SNAPPY_BUILD_BENCHMARKS:BOOL=OFF
  )
  
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"
}

# check() {
#   local ctest_exclude_regex=""
#   local ctest_options=(
#     --test-dir "${_pkgsrc}/build"
#     --output-on-failure
#     --parallel "$(nproc)"
#     --exclude-regex "${ctest_exclude_regex}"
#   )

#   cd "${srcdir}"
#   ctest "${ctest_options[@]}"
# }

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
