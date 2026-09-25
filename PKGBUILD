# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="crcpp"
pkgver=1.2.3.0
pkgrel=1
pkgdesc="Easy to use and fast C++ CRC library"
arch=(
  'any'
)
url="https://github.com/d-bahr/CRCpp"
license=(
  'BSD-3-Clause'
)
makedepends=(
  'cmake>=3.5'
  # 'doxygen'
)
_pkgsrc="${url##*/}-release-${pkgver}"
source=(
  "${url}/archive/refs/tags/release-${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('cc0cc28beb0c62512ca2ad1713a66c4518dfce6546672972f40e61bc382e1fba0a1e28d1c12a088a4db1786ad63cd5daff71fdb28a66975e280f0ed86ca9b9bf')

build() {
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-author
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D BUILD_DOC:BOOL=OFF
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${cmake_options[1]}"
}

check() {
  local ctest_exclude_regex=""
  local ctest_options=(
    --test-dir "${_pkgsrc}/build"
    --output-on-failure
    --parallel "$(nproc)"
    --exclude-regex "${ctest_exclude_regex}"
  )

  cd "${srcdir}"
  ctest "${ctest_options[@]}"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 "LICENSE"   -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
