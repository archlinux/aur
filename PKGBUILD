pkgname=mingw-w64-hunspell
pkgver=1.6.1
pkgrel=1
pkgdesc="Spell checker and morphological analyzer library (mingw-w64)"
arch=(any)
url="http://hunspell.github.io/"
license=("GPL" "LGPL" "MPL")
makedepends=(mingw-w64-configure mingw-w64-readline)
depends=(mingw-w64-gettext)
optdepends=(mingw-w64-readline)
options=(!strip !buildflags staticlibs !debug !emptydirs)
source=("https://github.com/hunspell/hunspell/archive/v${pkgver}.tar.gz"
"01-relocate.patch")
sha256sums=('30f593733c50b794016bb03d31fd2a2071e4610c6fa4708e33edad2335102c49'
            '2730c6cbca341db54f5d4a53a81c89f8e91ac6e3060af9740f5bb15185067806')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd hunspell-${pkgver}
  rm -rf src/tools/pathtools.cxx src/tools/pathtools.hxx
  patch -Np1 -i ${srcdir}/01-relocate.patch
	autoreconf -fi
}

build() {
  cd hunspell-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --disable-rpath \
      --enable-threads=win32 \
      --with-ui \
      --with-readline
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/hunspell-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    ln -s "/usr/${_arch}/lib/libhunspell-${pkgver%.*}.a" "$pkgdir/usr/${_arch}/lib/libhunspell.a"
    ln -s "/usr/${_arch}/lib/libhunspell-${pkgver%.*}.dll.a" "$pkgdir/usr/${_arch}/lib/libhunspell.dll.a"
  done
}
