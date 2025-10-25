# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="libE57Format"
pkgname="${_Name,,}"
pkgver=3.3.0
pkgrel=1
pkgdesc="Library for reading & writing the E57 file format"
arch=('x86_64')
url="https://github.com/asmaloney/${_Name}"
license=('BSL-1.0')
depends=(
  'gcc-libs'
  'glibc'
  'xerces-c>=3.2'
)
makedepends=(
  'cmake>=3.15'
)
provides=(
  "${_Name}.so"
)
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('7278504ccc57135975d6b363140d36e3236f1e8e28801407a1085241e960a82c5526668a10543db4733d64a2c60578cbae8dd839bd58bdf0473a213a6f39342b')

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
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
  install -vDm644 "CHANGELOG.md"  "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "README.md"     "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.md"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
