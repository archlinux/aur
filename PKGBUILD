# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="tree-sitter-matlab"
pkgver=1.2.5
pkgrel=1
pkgdesc="MATLAB tree-sitter parser"
arch=(
  'x86_64'
)
url="https://github.com/acristoffers/${pkgname}"
license=('MIT')
depends=(
  'glibc'
)
makedepends=(
  'cmake>=3.13'
)
provides=(
  "lib${pkgname}.so"
)
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('7b7f82f7d4bd00ffa780c4ed99ebe954dd861ddcf3d9ff7241a2dd46f431254b92d4153d71eeaa4dee371fabf88c120549ec24ce4a6807b209c746ad09a9d113')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -e 's|${CMAKE_INSTALL_DATAROOTDIR}/pkgconfig|${CMAKE_INSTALL_LIBDIR}/pkgconfig|g' \
      -i 'CMakeLists.txt'
}

build() {
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${_pkgsrc}/build"
    -S "${_pkgsrc}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D CMAKE_INSTALL_LIBDIR:PATH='lib'
    -D CMAKE_INSTALL_INCLUDEDIR:PATH='include'
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
#     --exclude-regex "${excluded_tests}"
#   )

#   cd "${srcdir}"
#   ctest "${ctest_flags[@]}"
# }

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${_pkgsrc}/build"
  
  cd "${_pkgsrc}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
