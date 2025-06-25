# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="libE57Format"
pkgname="${_Name,,}"
pkgver=3.2.0
pkgrel=1
pkgdesc="Library for reading & writing the E57 file format"
arch=('x86_64')
url="https://github.com/asmaloney/${_Name}"
license=('BSL-1.0')
depends=('gcc-libs' 'glibc' 'xerces-c')
makedepends=('cmake>=3.15')
provides=("${_Name}.so")
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('076566028701727a746d246908e0b20871fdbb0e4832ec6e57738b0ab4172d3cf179172103de5569cfdab555c70a8cd79a82d70a68d52942e0d51619a5e38091')

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_INSTALL_LIBDIR='lib' # no GNUInstallDirs?
    -D BUILD_SHARED_LIBS:BOOL=ON
    -D E57_BUILD_TEST:BOOL=OFF
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
#     --parallel "$(nproc)"
#     --exclude-regex "$excluded_tests"
#   )
# 
#   cd "${srcdir}"
#   ctest "${ctest_flags[@]}"
# }

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
