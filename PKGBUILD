pkgname=mingw-w64-fann
pkgver=2.2.0
pkgrel=1
pkgdesc="Fast artificial neural network library (mingw-w64)"
arch=(any)
url="http://leenissen.dk/fann/"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
license=('LGPL2.1')
options=('!buildflags' 'staticlibs' '!strip')
source=("http://downloads.sourceforge.net/fann/${pkgver}/FANN-${pkgver}-Source.zip"
        'fann-mingw.patch')
md5sums=('292d914684c9eab1d84eb1f59b0fbf69'
         '130a56a7674a47db5c3aa6f81efb44fb')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir/FANN-${pkgver}-Source"
  patch -p1 -i "$srcdir"/fann-mingw.patch
}


build() {
  cd "$srcdir/FANN-${pkgver}-Source"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=OFF \
      ..
    make
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DCMAKE_BUILD_TYPE=Release \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do  
    cd "$srcdir/FANN-${pkgver}-Source/build-${_arch}-static"
    make DESTDIR="$pkgdir" install
    cd "$srcdir/FANN-${pkgver}-Source/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

