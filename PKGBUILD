
pkgname=mingw-w64-lapack
pkgname=('mingw-w64-lapack' 'mingw-w64-blas')
pkgver=3.5.0
pkgrel=6
arch=('any')
pkgdesc="Linear Algebra PACKage (mingw-w64)"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
license=('LGPL')
url="http://www.netlib.org/lapack"
source=("http://www.netlib.org/lapack/lapack-${pkgver}.tgz")
sha1sums=('5870081889bf5d15fd977993daab29cf3c5ea970')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build()
{
  cd "$srcdir/lapack-${pkgver}"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=OFF \
      -DLAPACKE=ON \
      -DBUILD_TESTING=OFF \
      ..
    make
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DLAPACKE=ON \
      -DBUILD_TESTING=OFF \
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
    rm "$pkgdir"/usr/${_arch}/*/libblas* 
    rm "$pkgdir"/usr/${_arch}/lib/pkgconfig/blas.pc
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

package_mingw-w64-blas()
{
  pkgdesc="Basic Linear Algebra Subprograms (mingw-w64)"
  for _arch in ${_architectures}; do
    install -d "$pkgdir"/usr/${_arch}/bin
    install -d "$pkgdir"/usr/${_arch}/lib/pkgconfig
    cd "$srcdir/lapack-${pkgver}/build-${_arch}-static"
    install -m644 lib/libblas.a "$pkgdir"/usr/${_arch}/lib
    cd "$srcdir/lapack-${pkgver}/build-${_arch}"
    install -m644 lib/libblas.dll.a "$pkgdir"/usr/${_arch}/lib
    install -m755 bin/libblas.dll "$pkgdir"/usr/${_arch}/bin
    install -m644 BLAS/blas.pc "$pkgdir"/usr/${_arch}/lib/pkgconfig
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

