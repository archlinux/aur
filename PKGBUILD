# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="CRCpp"
pkgname="${_Name,,}"
pkgver=1.2.1.0
pkgrel=1
pkgdesc="Easy to use and fast C++ CRC library"
arch=('any')
url="https://github.com/d-bahr/${_Name}"
license=('BSD-3-Clause')
makedepends=('cmake>=3.5') # 'doxygen')
_pkgsrc="${url##*/}-release-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/release-${pkgver}.tar.gz")
b2sums=('43e49844676aec19a78fb2a1f0a00f12caa79501095b39cd7dba52f31d495926f30046775f154a99e00f4c6cf91e05e996016eb7cdf63a31ecc45bc5942a3100')

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D BUILD_DOC:BOOL=OFF
    -D BUILD_TEST:BOOL=ON
  )

  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${_pkgsrc}/build"
}

check() {
  local excluded_tests=""
  local ctest_flags=(
    --test-dir "${_pkgsrc}/build"
    --output-on-failure
    --parallel "$(nproc)"
    --exclude-regex "$excluded_tests"
  )

  cd "${srcdir}"
  ctest "${ctest_flags[@]}"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
