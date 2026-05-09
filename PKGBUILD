# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="crcpp"
pkgver=1.2.1.0
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
b2sums=('43e49844676aec19a78fb2a1f0a00f12caa79501095b39cd7dba52f31d495926f30046775f154a99e00f4c6cf91e05e996016eb7cdf63a31ecc45bc5942a3100')

build() {
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D BUILD_DOC:BOOL=OFF
    -D BUILD_TEST:BOOL=ON
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
