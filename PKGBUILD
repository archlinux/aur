# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="blend2d"
pkgver=0.21.2
pkgrel=1
pkgdesc="A high-performance 2D vector graphics engine written in C++"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://blend2d.com"
license=('Zlib')
depends=(
  'glibc'
)
makedepends=(
  'clang'
  'cmake>=3.19'
)
provides=(
  "lib${pkgname}.so"
)
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/download/${_pkgsrc}.tar.gz")
sha256sums=('234ba57a64153c96885a6271f15fdcf6c594ac8cb03adaad19abb8d3b2b533fa')
b2sums=('284c819c87abcba340d2ff9b3f9ca3103270ccddeeb081b18f1381d33d7ae114d43cecd1f4b8fc99ffae9750b973b6d4b45f9be344122218fb6f5e093b1ebf32')

prepare() {
  cd "${srcdir}/${pkgname}"
  sed -i '/-O2/d' 'CMakeLists.txt'
}

build() {
  export CC="clang"
  export CXX="clang++"
  local cmake_options=(
    -G 'Unix Makefiles'
    -B "${pkgname}/build"
    -S "${pkgname}"
    -W no-dev
    -D CMAKE_BUILD_TYPE:STRING='None'
    -D CMAKE_INSTALL_PREFIX:PATH='/usr'
    -D BLEND2D_TEST:BOOL=TRUE
    -D BLEND2D_EMBED:BOOL=FALSE
    -D BLEND2D_STATIC:BOOL=FALSE
    -D BLEND2D_EXTERNAL_ASMJIT:BOOL=FALSE
  )
 
  cd "${srcdir}"
  cmake "${cmake_options[@]}"
  cmake --build "${pkgname}/build"
}

check() {
  local excluded_tests=""
  local ctest_flags=(
    --test-dir "${pkgname}/build"
    --output-on-failure
    --parallel "$(nproc)"
    --exclude-regex "${excluded_tests}"
  )

  cd "${srcdir}"
  ctest "${ctest_flags[@]}"
}

package() {
  cd "${srcdir}"
  DESTDIR="${pkgdir}" cmake --install "${pkgname}/build"
  
  cd "${pkgname}"
  install -vDm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
