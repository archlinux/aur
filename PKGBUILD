# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-hunspell
pkgver=1.6.2
pkgrel=1
pkgdesc="Spell checker and morphological analyzer library and program (mingw-w64)"
arch=(any)
url="https://hunspell.github.io/"
license=("GPL" "LGPL" "MPL")
makedepends=('mingw-w64-configure' 'mingw-w64-readline' 'mingw-w64-wine')
depends=('mingw-w64-gettext' 'mingw-w64-ncurses' 'mingw-w64-readline')
options=(!strip !buildflags staticlibs !debug !emptydirs)
source=("hunspell-${pkgver}.tar.gz"::"https://github.com/hunspell/hunspell/archive/v${pkgver}.tar.gz"
        "01-relocate.patch")
sha256sums=('3cd9ceb062fe5814f668e4f22b2fa6e3ba0b339b921739541ce180cac4d6f4c4'
            '2730c6cbca341db54f5d4a53a81c89f8e91ac6e3060af9740f5bb15185067806')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd "${srcdir}/hunspell-${pkgver}"
  
  # Remove files created by patch
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
