# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="aliyun-oss-cpp-sdk"
pkgver=1.10.0
pkgrel=1
pkgdesc="Aliyun OSS SDK for C++"
arch=('x86_64')
url="https://github.com/aliyun/${pkgname}"
license=('Apache-2.0')
depends=('curl' 'gcc-libs' 'glibc' 'openssl')
makedepends=('cmake>=3.1' 'dos2unix')
provides=('libalibabacloud-oss-cpp-sdk.so')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}_cmake_build_static_libs.patch"
        "${pkgname}_cmake_sdk_compiler_flags.patch")
b2sums=('411a820c049d191f964fc987ea3e10c32321038a9c20f7113a702440c76203b2beef5bc0402d0870200252d90c128798216b3dc5184290cbb02a0df088113202'
        '609408ff4f7aedc3b0e39a4cc5148e26ef8ab34b700470a3b525f4f4059bd13a43100fa82c1fbb6ccb17afda0b494f08843067ae880dfaee594f79ace829dd0e'
        'b26876f7dfca56ccb14959280b184fd6105cc0b10602066696a66d611ff075b413481c25231c9d2ed32926a5e4eb1c4ff1d84e86673dca7f6c5abadfc86f5f4c')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  find . -type f -name 'CMakeLists.txt' -exec \
    dos2unix "{}" +

  patch -Np1 -i "${srcdir}/${pkgname}_cmake_build_static_libs.patch"
  patch -Np1 -i "${srcdir}/${pkgname}_cmake_sdk_compiler_flags.patch"
}

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -Wno-dev
    -DCMAKE_BUILD_TYPE:STRING='None'
    -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    -DBUILD_SHARED_LIBS=ON
    # -DBUILD_STATIC_LIBS=ON
    # -DSTATIC_LIB_SUFFIX=""
    -DBUILD_SAMPLE=OFF
    # -DBUILD_TESTS=ON
    -DBUILD_TESTS=OFF
    -DENABLE_COVERAGE=OFF
    -DENABLE_RTTI=OFF
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
