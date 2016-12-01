pkgname=mingw-w64-hunspell
pkgver=1.5.3
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
"0005-windows-sub-dicts-paths.patch")
md5sums=('f7d54255e79b8457f5880b3c966e62c2'
         '8f3f269734623b2c57521202877c51bd')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd hunspell-${pkgver}
  patch -Np1 -i "${srcdir}"/0005-windows-sub-dicts-paths.patch
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
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    ln -s "/usr/${_arch}/lib/libhunspell-${pkgver%.*}.a" "$pkgdir/usr/${_arch}/lib/libhunspell.a"
    ln -s "/usr/${_arch}/lib/libhunspell-${pkgver%.*}.dll.a" "$pkgdir/usr/${_arch}/lib/libhunspell.dll.a"
  done
}
