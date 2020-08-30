pkgname=mingw-w64-libmikmod
pkgver=3.3.11.1
pkgrel=1
pkgdesc="A portable sound library (mingw-w64)"
arch=(any)
url="http://mikmod.shlomifish.org"
license=("GPL, LGPL")
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt' 'mingw-w64-openal')
options=('staticlibs' '!strip' '!buildflags')
source=("http://downloads.sourceforge.net/mikmod/libmikmod-$pkgver.tar.gz")
sha256sums=('ad9d64dfc8f83684876419ea7cd4ff4a41d8bcd8c23ef37ecb3a200a16b46d19')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/libmikmod-$pkgver"
}

build() {
  cd "$srcdir/libmikmod-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-threads=win32 \
      --enable-openal ..
    make
    popd
  done
}

package() {
  install -d "$pkgdir/usr/bin"
  for _arch in ${_architectures}; do
    cd "${srcdir}/libmikmod-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm -r "$pkgdir/usr/${_arch}/share"
    ln -s "/usr/${_arch}/bin/libmikmod-config" "$pkgdir/usr/bin/${_arch}-libmikmod-config"
  done
}
