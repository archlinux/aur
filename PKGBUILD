# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="mcut"
pkgver=1.3.0
pkgrel=2
pkgdesc="Library for detecting and resolving intersections between two surface meshes"
arch=(
  'x86_64'
)
url="https://cutdigital.github.io/mcut.site/"
_url="https://github.com/cutdigital/${pkgname}"
license=(
  'LGPL-3.0-or-later'
)
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
)
makedepends=(
  'cmake>=3.13'
)
provides=(
  "lib${pkgname}.so"
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
  "${pkgname}_gcc15_cstdint.patch"
)
b2sums=('35cbe68e36489b720fcfbee98d2b9d5f41cbf37313f170300c6ef27b3dc49f25370429a2517f01b6d605f4a46d9e809d7f8ec076f30756359b9941316ebea52d'
        '859e0153c3ee6c44812d7db27b1e57699bfa63f6ad9eb67c09fd3ec8d81de54a3a30956f26a3719b0c3df4d3a40c766f486b83b7048dab0c022cf534d2e20821')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "${srcdir}/${pkgname}_gcc15_cstdint.patch"
}

build() {
  local cmake_arguments=(
    -G 'Unix Makefiles'
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D MCUT_BUILD_AS_SHARED_LIB:BOOL=ON
    -D MCUT_BUILD_DOCUMENTATION:BOOL=OFF
    -D MCUT_BUILD_TESTS:BOOL=OFF
    -D MCUT_BUILD_TUTORIALS:BOOL=OFF
  )

  cd "${srcdir}"
  cmake -B "${_pkgsrc}/build" -S "${_pkgsrc}" "${cmake_arguments[@]}"
  cmake --build "${_pkgsrc}/build"
}

# check() {
#   local ctest_exclude_regex=""
#   local ctest_arguments=(
#     --output-on-failure
#     --parallel $(nproc)
#     --exclude-regex "${excluded_tests}"
#   )
# 
#   cd "${srcdir}"
#   ctest --test-dir "${_pkgsrc}/build" "${ctest_arguments[@]}"
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
