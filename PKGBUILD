# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="OpenEXR"
_basename="${_Name,,}"
pkgver=3.2.4
_pkgver="${pkgver%.*}"
pkgrel=1
pkgbase="${_basename}${_pkgver}"
pkgname=("${pkgbase}"{,-libs})
pkgdesc="A high dynamic-range image file format library (version ${_pkgver})"
arch=('x86_64')
url="https://www.openexr.com"
_url="https://github.com/${_basename}/${_basename}"
license=('BSD-3-Clause')
depends=('gcc-libs' 'glibc' 'imath')
makedepends=('cmake>=3.12' 'libdeflate')
options=('!emptydirs')
_pkgsrc="${_url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('ecc3d8b206bda5e5897ac9cd797a8432b76981de10d49cbb107af2b4108c22186de0dda25a9a43b07e18d641ef71508445d95f659a4ca932e029d48ee029a492')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
}

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_INSTALL_DOCDIR:PATH="share/doc/${_Name}${_pkgver}"
    -D CMAKE_INSTALL_INCLUDEDIR:PATH="include/${pkgbase}"
    -D CMAKE_INSTALL_LIBDIR:PATH="lib/${pkgbase}"
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

package_openexr3.2() {
  depends+=("${pkgbase}-libs=${pkgver}-${pkgrel}")

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  install -vDm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgbase}/README.md"
  install -vDm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE.md"

  cd "${pkgdir}/usr"
  find "lib" -type f,l -name 'lib*.so*' -delete

  for file in bin/*; do
    mv "${file}" "${file}${_pkgver}"
  done
}

package_openexr3.2-libs() {
  pkgdesc+=" (runtime libraries)"
  depends+=('libdeflate')
  provides=('libIex-3_2.so' 'libIlmThread-3_2.so' 'libOpenEXR-3_2.so' 'libOpenEXRCore-3_2.so' 'libOpenEXRUtil-3_2.so')

  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${pkgdir}"
  find . -type f,l ! -name 'lib*.so*' -delete

  cd "usr/lib/${pkgbase}"
  for lib in lib*"${_pkgver//./_}".so*; do
    ln -sf "/usr/lib/${pkgbase}/${lib}" "${pkgdir}/usr/lib/${lib}"
  done
}
