# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="blend2d"
pkgver=0.20.0
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
sha256sums=('6f08f42fa53ebf57bffa7e18894294b44d6fbc478f6dbbf105791d551fdf6729')
b2sums=('241c6135a4ab37210e43f607bd0bc1f69b3bcfc7493c74fb95dfd22d3fc2b95c70d86a616391aebc2862223347d3334077330c4326d8a426215e80473e8c0472')

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
