# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="caps-log"
pkgver=1.2.1
pkgrel=4
pkgdesc="A small, terminal-based journaling tool"
arch=('x86_64')
url="https://github.com/NikolaDucak/${pkgname}"
license=('MIT')
depends=('boost-libs' 'fmt>=9' 'gcc-libs' 'glibc' 'libgit2' 'openssl')
makedepends=('boost' 'cmake>=3.14' 'ftxui5') # 'gtest'
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}_openssl_shared.patch")
        # "${pkgname}_dont_install_tests.patch")
sha256sums=('10090ffc24ae28b7c466999d47c46c649daacbac86107d909d78bafef0e012d7'
            'b86336c24292ecbf3a627129a0f6c416d121c16ea93ec5735d2a8049572de1e7')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_openssl_shared.patch"
  # patch -Np1 -i "${srcdir}/${pkgname}_dont_install_tests.patch"
}

build() {
  export CXXFLAGS+=" -I/usr/include/ftxui5"
  export LDFLAGS+=" -L/usr/lib/ftxui5"
  local cmake_options=(
    -G 'Unix Makefiles' \
    -B "${_pkgsrc}/build" \
    -S "${_pkgsrc}" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -Dftxui_DIR:PATH='/usr/lib/ftxui5/cmake/ftxui' \
    -DCAPS_LOG_VERSION:STRING="${pkgver}" \
    -DCAPS_LOG_BUILD_TESTS:BOOL=OFF \
    -Wno-dev
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
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENCE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
