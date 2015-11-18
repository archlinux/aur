
pkgname=mingw-w64-lapack
pkgver=3.6.0
pkgrel=1
arch=('any')
pkgdesc="Linear Algebra PACKage (mingw-w64)"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
provides=('mingw-w64-blas' 'mingw-w64-cblas')
replaces=('mingw-w64-blas' 'mingw-w64-cblas')
options=('!buildflags' '!strip' 'staticlibs')
license=('LGPL')
url="http://www.netlib.org/lapack"
source=("http://www.netlib.org/lapack/lapack-${pkgver}.tgz")
sha1sums=('7e993de16d80d52b22b6093465eeb90c93c7a2e7')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/lapack-${pkgver}"
  # see r1651
  sed -e 's|/CMAKE/|/cmake/|' -i CBLAS/CMakeLists.txt
}

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
      -DCBLAS=ON \
      -DBUILD_TESTING=OFF \
      ..
    make
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DLAPACKE=ON \
      -DCBLAS=ON \
      -DBUILD_TESTING=OFF \
      ..
    make
    popd
  done
}

package()
{
  for _arch in ${_architectures}; do
    cd "$srcdir/lapack-${pkgver}/build-${_arch}-static"
    make install DESTDIR="$pkgdir"
    cd "$srcdir/lapack-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

