
pkgname=mingw-w64-pocketsphinx
pkgver=5prealpha
pkgrel=1
pkgdesc="Lightweight speech recognition engine (mingw-w64)"
url="http://cmusphinx.sourceforge.net/"
arch=('any')
license=('BSD')
depends=('mingw-w64-sphinxbase')
makedepends=('mingw-w64-configure' 'bison')
options=('staticlibs' '!buildflags' '!strip')
source=("http://downloads.sourceforge.net/cmusphinx/pocketsphinx-$pkgver.tar.gz")
sha256sums=('ef5bb5547e2712bdf571f256490ef42a47962033892efd9d7df8eed7fe573ed9')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd pocketsphinx-$pkgver
  sed -i "s|_la_LDFLAGS = -version-info|_la_LDFLAGS = -no-undefined -version-info|g" src/libpocketsphinx/Makefile.am
  autoreconf -i
}

build() {
  cd pocketsphinx-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --without-python
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/pocketsphinx-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
