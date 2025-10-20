# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="aliyun-oss-cpp-sdk"
pkgver=1.10.1
pkgrel=1
pkgdesc="Aliyun OSS SDK for C++"
arch=('x86_64')
url="https://github.com/aliyun/${pkgname}"
license=('Apache-2.0')
depends=(
  'curl'
  'gcc-libs'
  'glibc'
  'openssl'
)
makedepends=(
  'cmake>=3.1'
  'dos2unix'
)
provides=(
  'libalibabacloud-oss-cpp-sdk.so'
)
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}_cmake_build_static_libs.patch")
b2sums=('6aa4d6fdc7d128bdd71624a115dfd894ea48e76665aaf992e0ead7f0a3cf48788dca66f48fdc24576a571fcc2b4689a5c3ebbaa8f02e73a7f9f170847fb06f76'
        '797a0e343893acb752821e5481813451fd6bec5afa6893926e9369240efeb1f01da82ecddf33eae4810bd1cbe833f4b4f8449a85a42f2a9806ee2654006d2879')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  find . -type f -name 'CMakeLists.txt' -exec \
    dos2unix "{}" +

  patch -Np1 -i "${srcdir}/${pkgname}_cmake_build_static_libs.patch"

  find . -type f -name 'CMakeLists.txt' -exec \
    sed -i 's/-Werror//g' "{}" +
}

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D BUILD_SHARED_LIBS:BOOL=ON
    -D BUILD_STATIC_LIBS:BOOL=OFF
    # -D STATIC_LIB_SUFFIX=""
    -D BUILD_SAMPLE:BOOL=OFF
    # -D BUILD_TESTS:BOOL=ON
    -D BUILD_TESTS:BOOL=OFF
    -D ENABLE_COVERAGE:BOOL=OFF
    -D ENABLE_RTTI:BOOL=OFF
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

  cd "${_pkgsrc}"
  install -vDm644 "CHANGELOG" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
