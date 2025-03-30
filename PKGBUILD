# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="mcut"
pkgver=1.3.0
pkgrel=1
pkgdesc="Library for detecting and resolving intersections between two surface meshes"
arch=('x86_64')
url="https://cutdigital.github.io/mcut.site/"
_url="https://github.com/cutdigital/${pkgname}"
license=('LGPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cmake>=3.13')
provides=("lib${pkgname}.so")
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('35cbe68e36489b720fcfbee98d2b9d5f41cbf37313f170300c6ef27b3dc49f25370429a2517f01b6d605f4a46d9e809d7f8ec076f30756359b9941316ebea52d')

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -Wno-dev
    -DCMAKE_BUILD_TYPE:STRING='None'
    -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    -DMCUT_BUILD_AS_SHARED_LIB=ON
    -DMCUT_BUILD_DOCUMENTATION=OFF
    -DMCUT_BUILD_TESTS=OFF
    -DMCUT_BUILD_TUTORIALS=OFF
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
# 

package() {
  cd "${srcdir}"
  # DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"

  cd "${_pkgsrc}"
  find "include" -mindepth 1 -maxdepth 2 -type f -exec \
    install -vDm644 "{}" "${pkgdir}/usr/{}" \;

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -vDm644 "COPYING.LESSER" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  cd "build/bin"
  install -vDm644 "lib${pkgname}.so".* -t "${pkgdir}/usr/lib/"

  cd "${pkgdir}/usr"
  # find . -mindepth 1 -maxdepth 1 -type f -delete

  cd "lib"
  for lib in *.so.*; do
    ln -vsf "${lib}" "${lib%.[0-9]*.[0-9]*.[0-9]*}"
    ln -vsf "${lib}" "${lib%.[0-9]*.[0-9]*}"
  done
}

# vim:set ts=2 sw=2 et:
