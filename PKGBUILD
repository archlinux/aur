pkgname=mingw-w64-cminpack
pkgver=1.3.7
pkgrel=1
pkgdesc="A C/C++ rewrite of the MINPACK software (mingw-w64)"
arch=('any')
url='http://devernay.free.fr/hacks/cminpack/cminpack.html'
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-cblas')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/devernay/cminpack/archive/v${pkgver}.tar.gz")
sha256sums=('b891f33ffcfb8b246bb6147a4da6308cdb2386ca42a99892ff9b2e884f8b0386')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd $srcdir/cminpack-${pkgver}
  curl -L https://github.com/devernay/cminpack/pull/44.patch | patch -p1
}

build() {
  cd $srcdir/cminpack-${pkgver}
    for _arch in ${_architectures}; do
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake -DCMINPACK_LIB_INSTALL_DIR=lib \
     -DBUILD_EXAMPLES=OFF -DBUILD_SHARED_LIBS=OFF ..
    make
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DCMINPACK_LIB_INSTALL_DIR=lib \
    -DBUILD_EXAMPLES=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/cminpack-${pkgver}/build-${_arch}-static"
    make install DESTDIR="$pkgdir"
    cd "$srcdir/cminpack-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
