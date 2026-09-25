# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="libe57format"
pkgver=3.4.1
pkgrel=1
pkgdesc="Library for reading & writing the E57 file format"
arch=(
  'x86_64'
)
url="https://github.com/asmaloney/libE57Format"
license=(
  'BSL-1.0'
)
depends=(
  'glibc'
  'xerces-c>=3.2'
  'libgcc'
  'libstdc++'
)
makedepends=(
  'cmake>=3.15'
)
provides=(
  "libE57Format.so"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('9e057d2db3298455933f65d22fb6dc6dbca35c99c1d8511374cee7195937ce6e15150e20dc1812f8549b24ceac4f97ca3cdd4012a2b12e6cdca8dfc85f07c6f6')

build() {
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-author
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D BUILD_SHARED_LIBS:BOOL=ON
    -D E57_BUILD_TEST:BOOL=OFF
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

  cd "${_pkgsrc}"
  install -vDm644 "CHANGELOG.md" "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
