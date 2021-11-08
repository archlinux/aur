pkgname=('mingw-w64-z3')
pkgver=4.8.12
pkgrel=1
pkgdesc='High-performance theorem prover (mingw-w64)'
url='https://github.com/Z3Prover/z3'
arch=('any')
license=('MIT')
makedepends=('mingw-w64-cmake' 'python')
options=('!strip' '!buildflags' 'staticlibs')
depends=('mingw-w64-gmp')
source=("https://github.com/Z3Prover/z3/archive/z3-${pkgver}.tar.gz")
sha512sums=('0b377923bdaffaca1846aa2abd61003bbecadfcdfc908ed3097d0aac8f32028ac39d93fb4a9c2e2c2bfffbdbee80aa415875f17de6c2ee2ae8e2b7921f788c6e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd z3-z3-${pkgver}
}

build() {
  cd z3-z3-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DZ3_USE_LIB_GMP=1 -DZ3_BUILD_EXECUTABLE=OFF -DZ3_BUILD_TEST_EXECUTABLES=OFF -DZ3_ENABLE_EXAMPLE_TARGETS=OFF ..
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
