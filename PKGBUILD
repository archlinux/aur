pkgname=mingw-w64-hunspell
pkgver=1.3.4
pkgrel=1
pkgdesc="Spell checker and morphological analyzer library (mingw-w64)"
arch=(any)
url="http://hunspell.github.io/"
license=("GPL" "LGPL" "MPL")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-gettext)
options=(!strip !buildflags staticlibs !debug)
source=("https://github.com/hunspell/hunspell/archive/v${pkgver}.tar.gz"
"hunspell-1.3.2-canonicalhost.patch")
md5sums=('423cff69e68c87ac11e4aa8462951954'
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
      --without-readline
		# temporarily copy hunvisapi.h to work around build process
		# where the file is not spotted.
		cp ${srcdir}/hunspell-${pkgver}/build-${_arch}/src/hunspell/hunvisapi.h \
       "${srcdir}/hunspell-${pkgver}/src/hunspell"
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
