pkgname=mingw-w64-suitesparse
pkgver=7.4.0
pkgrel=1
pkgdesc="A collection of sparse matrix libraries (mingw-w64)"
url="https://people.engr.tamu.edu/davis/suitesparse.html"
arch=('any')
depends=('mingw-w64-lapack' 'mingw-w64-mpfr')
makedepends=('mingw-w64-cmake')
license=('GPL')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v${pkgver}.tar.gz")
sha256sums=('f9a5cc2316a967198463198f7bf10fb8c4332de6189b0e405419a7092bc921b7')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/SuiteSparse-${pkgver}"
  for _arch in ${_architectures}
  do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DSUITESPARSE_DEMOS=OFF -DBUILD_TESTING=OFF -DGRAPHBLAS_USE_JIT=OFF \
      -DNPARTITION=1 -DBLA_VENDOR=Generic -DHAVE_GETENV_HOME=0 ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}
  do
    cd "$srcdir/SuiteSparse-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
