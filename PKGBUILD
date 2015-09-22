pkgname=mingw-w64-hunspell
pkgver=1.3.3
pkgrel=1
pkgdesc="Spell checker and morphological analyzer library (mingw-w64)"
arch=(any)
url="http://hunspell.sourceforge.net/"
license=("GPL" "LGPL" "MPL")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-gettext)
options=(!strip !buildflags staticlibs)
source=("http://downloads.sourceforge.net/hunspell/hunspell-$pkgver.tar.gz"
"hunspell-1.3.2-canonicalhost.patch")
md5sums=('4967da60b23413604c9e563beacc63b4'
         'f8a5c0f3692a390d98daf0406da59cdf')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd hunspell-${pkgver}
	patch -Np1 -i "$srcdir"/hunspell-1.3.2-canonicalhost.patch
	autoreconf -fi
}

build() {
  cd hunspell-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --disable-rpath \
      --enable-threads=win32 \
      --without-ui \
      --without-readline \
      --with-experimental
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/hunspell-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    ln -s "/usr/${_arch}/lib/libhunspell-${pkgver%.*}.a" "$pkgdir/usr/${_arch}/lib/libhunspell.a"
    ln -s "/usr/${_arch}/lib/libhunspell-${pkgver%.*}.dll.a" "$pkgdir/usr/${_arch}/lib/libhunspell.dll.a"
    rm -r "$pkgdir/usr/${_arch}/share"
    rm "$pkgdir/usr/${_arch}/bin/"{affixcompress,ispellaff2myspell,makealias,wordforms,wordlist2hunspell}
  done
}
