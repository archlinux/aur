
pkgname=mingw-w64-sphinxbase
pkgver=5prealpha
pkgrel=1
pkgdesc="Common library for sphinx speech recognition. (mingw-w64)"
url="http://cmusphinx.sourceforge.net/"
arch=('any')
license=('BSD')
depends=('mingw-w64-lapack')
makedepends=('mingw-w64-configure' 'bison')
options=('staticlibs' '!buildflags' '!strip')
source=("http://downloads.sourceforge.net/project/cmusphinx/sphinxbase/${pkgver}/sphinxbase-${pkgver}.tar.gz")
sha256sums=('f72bdb59e50b558bed47cc2105777200d2b246a0f328e913de16a9b22f9a246f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd sphinxbase-$pkgver
  sed -i "s|_la_LDFLAGS = -version-info|_la_LDFLAGS = -no-undefined -version-info|g" src/libsphinxbase/Makefile.am src/libsphinxad/Makefile.am
  autoreconf -i
}

build() {
  cd sphinxbase-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --without-python
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/sphinxbase-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
