# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="blend2d"
pkgver=0.12.0
pkgrel=1
pkgdesc="A high-performance 2D vector graphics engine written in C++"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://blend2d.com"
license=('Zlib')
depends=('glibc')
makedepends=('clang' 'cmake>=3.19')
provides=("lib${pkgname}.so")
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/download/${_pkgsrc}.tar.gz")
sha256sums=('8d2f9466451fc0e464bf67edef34c28391a5bf57d26d684453a03d1a1a5b2730')
b2sums=('174def212ac2c01405a3e6340fe0d42cb0a1a40b6b6c9bf26a93ec517e3b3b29a047a3a1d018c2af87a6a7f164974c52cf232f893ed2956a5d58d4b8a2126d9b')

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
    -Wno-dev
    -DCMAKE_BUILD_TYPE:STRING='None'
    -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    -DBLEND2D_TEST:BOOL=TRUE
    -DBLEND2D_EMBED:BOOL=FALSE
    -DBLEND2D_STATIC:BOOL=FALSE
    -DBLEND2D_EXTERNAL_ASMJIT:BOOL=FALSE
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
    --parallel $(nproc)
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
