# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="abseil-cpp"
pkgname="lib32-${_name}"
pkgver=20250127.1
pkgrel=1
pkgdesc="Collection of C++ library code designed to augment the C++ standard library (32-bit)"
arch=('x86_64')
url="https://abseil.io"
_url="https://github.com/abseil/${_name}"
license=('Apache-2.0')
depends=('lib32-gcc-libs' 'lib32-glibc' 'lib32-gtest' "${_name}>=${pkgver}")
makedepends=('cmake>=3.16')
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz"
        'scoped-mock-log.patch')
sha256sums=('b396401fd29e2e679cace77867481d388c807671dc2acc602a0259eeb79b7811'
            'a6cbc612a2b96fcbd52d081e03e8581107ceb4827edb19d96510a31c568e1396')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  # Install target needed by protobuf
  patch -Np1 -i "${srcdir}/scoped-mock-log.patch"
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
    -DCMAKE_CXX_STANDARD=17
    -DBUILD_SHARED_LIBS:BOOL=ON
    -DABSL_BUILD_TESTING:BOOL=OFF
    -DABSL_BUILD_TEST_HELPERS:BOOL=ON
    -DABSL_USE_EXTERNAL_GOOGLETEST:BOOL=ON
    -DABSL_FIND_GOOGLETEST:BOOL=ON
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
