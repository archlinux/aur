pkgname=('mingw-w64-z3')
pkgver=4.11.2
pkgrel=1
pkgdesc='High-performance theorem prover (mingw-w64)'
url='https://github.com/Z3Prover/z3'
arch=('any')
license=('MIT')
makedepends=('mingw-w64-cmake' 'python')
options=('!strip' '!buildflags' 'staticlibs')
depends=('mingw-w64-gmp')
source=("https://github.com/Z3Prover/z3/archive/z3-${pkgver}.tar.gz")
sha512sums=('be2573d38c0e50b46fcb025d50335e016769fdeab3c26f5dc2a13102fae889d23039258ea8d38de3f53daa4cf073704d8639ac291e781a74633194adedaae21a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd z3-z3-${pkgver}
}

build() {
  cd z3-z3-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DZ3_USE_LIB_GMP=1 -DZ3_BUILD_EXECUTABLE=OFF -DZ3_BUILD_TEST_EXECUTABLES=OFF -DZ3_ENABLE_EXAMPLE_TARGETS=OFF -DCMAKE_BUILD_TYPE=Release ..
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
