# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="blend2d"
pkgver=0.21.0
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
sha256sums=('f360394e223f12053aac7f70b2c63df3c85de57cdf85efe4cc8cc8c446744cf9')
b2sums=('d0d1384b9d6ba1d5c1e665971c3c8103832715b46c8d1d3026e2433d373688f5e61974a9ad470ac0342651325839a7675cc0099ab35afff5d8cd4a63bcb0034d')

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
