pkgname=mingw-w64-gf2x
pkgver=1.1
pkgrel=2
pkgdesc="A library for multiplying polynomials over the binary field (mingw-w64)"
arch=('any')
url="http://gforge.inria.fr/projects/gf2x/"
license=('GPL' 'LGPL')
depends=('glibc')
epends=('mingw-w64-crt')
makedepends=('mingw-w64-configure' 'wine')
options=('staticlibs' '!buildflags' '!strip')
source=("http://gforge.inria.fr/frs/download.php/30873/gf2x-1.1.tar.gz")
sha256sums=('0d3f01604680102a00ca34e079903cc4d5a3208afda223748979b724d358849f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/gf2x-$pkgver"

  # add no-undefined to build dll
  sed -i "s|libgf2x_la_LDFLAGS=-version-info|libgf2x_la_LDFLAGS=-no-undefined -version-info|g" Makefile.am
  autoreconf -vfi
}


build() {
  cd "$srcdir/gf2x-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --disable-sse2 --disable-pclmul hwdir="x86_nosse2" # FIXME: sse2 build fails 
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/gf2x-$pkgver/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

