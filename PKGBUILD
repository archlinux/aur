# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="crcpp"
pkgver=1.2.2.0
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
b2sums=('99752eb2994e320b489f4c2afb856eb71a1c52cc92389197afa8c4869bfb531ae2dffb3c476f19d5d5d4db0416f6d4a1d0467037b340b0ef4579651234039b85')

build() {
  local cmake_options=(
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_INSTALL_INCLUDE_DIR:PATH='/usr/include'
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
