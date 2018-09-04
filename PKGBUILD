pkgname=mingw-w64-trilinos
pkgver=12.12.1
pkgrel=1
pkgdesc="Framework for the solution of large-scale, complex multi-physics engineering and scientific problems (mingw-w64)"
arch=(any)
url="http://trilinos.org"
license=('LGPL3')
depends=('mingw-w64-netcdf' 'mingw-w64-blas')
makedepends=('mingw-w64-cmake')
options=('staticlibs' '!buildflags' '!strip')
source=("https://github.com/trilinos/Trilinos/archive/trilinos-release-${pkgver//./-}.tar.gz" mingw.patch)
sha256sums=('5474c5329c6309224a7e1726cf6f0d855025b2042959e4e2be2748bd6bb49e18' SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir"/Trilinos-trilinos-release-${pkgver//./-}
  patch -p1 -i "$srcdir"/mingw.patch
}

build() {
  cd "$srcdir"/Trilinos-trilinos-release-${pkgver//./-}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DTrilinos_ENABLE_ALL_PACKAGES:BOOL=OFF \
      -DTrilinos_ENABLE_ALL_OPTIONAL_PACKAGES:BOOL=OFF \
      -DTrilinos_ENABLE_TESTS:BOOL=OFF \
      -DTrilinos_ENABLE_EXAMPLES:BOOL=OFF \
      -DTrilinos_ENABLE_Shards:BOOL=ON \
      -DTrilinos_ENABLE_GlobiPack:BOOL=ON \
      -DTrilinos_ENABLE_Zoltan:BOOL=ON \
      -DTrilinos_ENABLE_ROL:BOOL=ON \
      -DTrilinos_ENABLE_RTOp:BOOL=ON \
      -DTrilinos_ENABLE_Sacado:BOOL=ON \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/Trilinos-trilinos-release-${pkgver//./-}/build-${_arch}
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
