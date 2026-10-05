pkgname=mingw-w64-suitesparse
pkgver=7.14.1
pkgrel=2
pkgdesc="A collection of sparse matrix libraries (mingw-w64)"
url="https://people.engr.tamu.edu/davis/suitesparse.html"
arch=('any')
depends=('mingw-w64-lapack' 'mingw-w64-mpfr')
makedepends=('mingw-w64-cmake')
license=('GPL')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v${pkgver}.tar.gz")
sha256sums=('81e560e1f74546df139edb765b3f5bc865866da23062312ffe8fd821063c8397')

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}

build() {
  cd "$srcdir/SuiteSparse-${pkgver}"
  for _arch in ${_architectures}
  do
    ${_arch}-cmake -DSUITESPARSE_DEMOS=OFF -DBUILD_TESTING=OFF \
      -DBLA_VENDOR=Generic -DGRAPHBLAS_COMPACT=ON -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package() {
  cd "$srcdir/SuiteSparse-${pkgver}"
  for _arch in ${_architectures}
  do
    DESTDIR="$pkgdir" cmake --build build-${_arch} --target install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
