pkgname=('mingw-w64-z3')
pkgver=4.8.7
pkgrel=1
pkgdesc='High-performance theorem prover (mingw-w64)'
url='https://github.com/Z3Prover/z3'
arch=('any')
license=('MIT')
makedepends=('mingw-w64-cmake' 'python')
options=('!strip' '!buildflags' 'staticlibs')
depends=('mingw-w64-gmp')
source=("https://github.com/Z3Prover/z3/archive/z3-${pkgver}.tar.gz")
sha512sums=('145e2b2f1fa4edd0917107c7e1d54d779c7ed85c48af2ce6def4c90d1c4db05f74c9657e173cedf48770589fbe484c97fa1923295271cd3792523ffc4f67ed0c')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd z3-z3-${pkgver}
  sed -i "s|Windows.h|windows.h|g" src/util/memory_manager.cpp
  sed -i 's|RUNTIME DESTINATION "${CMAKE_INSTALL_LIBDIR}"|RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"|g' src/CMakeLists.txt
}

build() {
  cd z3-z3-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DUSE_LIB_GMP=1 ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/z3-z3-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
  done
}
