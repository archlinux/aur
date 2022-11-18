pkgname=mingw-w64-lapack
pkgname=('mingw-w64-lapack' 'mingw-w64-blas' 'mingw-w64-cblas' 'mingw-w64-lapacke')
pkgver=3.11.0
pkgrel=1
arch=('any')
pkgdesc="Linear Algebra PACKage (mingw-w64)"
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
license=('LGPL')
url="http://www.netlib.org/lapack"
source=("https://github.com/Reference-LAPACK/lapack/archive/v${pkgver}.tar.gz")
sha256sums=('4b9ba79bfd4921ca820e83979db76ab3363155709444a787979e81c22285ffa9')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare()
{
  cd "$srcdir/lapack-${pkgver}"
}

build()
{
  cd "$srcdir/lapack-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=OFF \
      -DLAPACKE=ON \
      -DCBLAS=ON \
      -DBUILD_TESTING=OFF \
      -DTEST_FORTRAN_COMPILER=OFF \
      ..
    make
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DLAPACKE=ON \
      -DCBLAS=ON \
      -DBUILD_TESTING=OFF \
      -DTEST_FORTRAN_COMPILER=OFF \
      ..
    make
    popd
  done
}

package_mingw-w64-lapack()
{
  depends=("mingw-w64-blas")
  for _arch in ${_architectures}; do
    cd "$srcdir/lapack-${pkgver}/build-${_arch}-static"
    make install DESTDIR="$pkgdir"
    cd "$srcdir/lapack-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/*/lib*blas*
    rm "$pkgdir"/usr/${_arch}/*/lib*lapacke*
    rm "$pkgdir"/usr/${_arch}/lib/pkgconfig/*blas.pc
    rm "$pkgdir"/usr/${_arch}/lib/pkgconfig/*lapacke.pc
    rm -r "$pkgdir"/usr/${_arch}/include/
    rm -r "$pkgdir"/usr/${_arch}/lib/cmake/cblas*
    rm -r "$pkgdir"/usr/${_arch}/lib/cmake/lapacke*
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

package_mingw-w64-blas()
{
  pkgdesc="Basic Linear Algebra Subprograms (mingw-w64)"
  depends=(mingw-w64-crt mingw-w64-gcc)
  for _arch in ${_architectures}; do
    cd "$srcdir/lapack-${pkgver}/build-${_arch}-static/BLAS"
    make install DESTDIR="$pkgdir"
    cd "$srcdir/lapack-${pkgver}/build-${_arch}/BLAS"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

package_mingw-w64-cblas()
{
  pkgdesc="C interface to BLAS (mingw-w64)"
  depends=("mingw-w64-blas")
  for _arch in ${_architectures}; do
    cd "$srcdir/lapack-${pkgver}/build-${_arch}-static/CBLAS"
    make install DESTDIR="$pkgdir"
    cd "$srcdir/lapack-${pkgver}/build-${_arch}/CBLAS"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

package_mingw-w64-lapacke()
{
  pkgdesc="C interface to LAPACK (mingw-w64)"
  depends=("mingw-w64-lapack")
  for _arch in ${_architectures}; do
    cd "$srcdir/lapack-${pkgver}/build-${_arch}-static/LAPACKE"
    make install DESTDIR="$pkgdir"
    cd "$srcdir/lapack-${pkgver}/build-${_arch}/LAPACKE"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
