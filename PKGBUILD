# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="libe57format"
pkgver=3.4.0
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
b2sums=('18373ebaa934723df05044ca41d477f9be1ff3e6eee46544c38793b43a40156dd4b7d9f46dd6d16917eabe2a29502f13542fdbc5f929398343e8a14f80bcc17b')

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
