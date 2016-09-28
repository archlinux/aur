pkgname=mingw-w64-hunspell
pkgver=1.4.1
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
"0001-canonicalhost.patch"
"0002-exit-on-MAX_PREFIXES_SUFFIXES.patch"
"0003-inc-MAX_PREFIXES_SUFFIXES-to-2048.patch"
"0004-relocate.patch"
"0005-windows-sub-dicts-paths.patch"
"0006-Fix-for-tool-Munch-when-compiling-with-Mingw64-for-6.patch"
"0007-Added-header-stddef-to-munch-and-unmunch.patch")
md5sums=('33d370f7fe5a030985e445a5672b2067'
         'f8b8363c7cf18b8cd26a1fa26dbdab4f'
         '6ce08c6825e925f52bf6ff0daa64493b'
         'caf363a9c8e4df381e105db82de8a69f'
         '26812f6444ed7c3e4ec38e12caaeb5d6'
         '8f3f269734623b2c57521202877c51bd'
         '748c5dcd456acb15f26c8a0c75478ae2'
         '5477347e27495b6d19c6a60a8eaa3e19')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd hunspell-${pkgver}
	#remove files created by patch
  rm -rf src/tools/pathtools.cxx src/tools/pathtools.hxx
  patch -Np1 -i "${srcdir}"/0001-canonicalhost.patch
  patch -Np1 -i "${srcdir}"/0002-exit-on-MAX_PREFIXES_SUFFIXES.patch
  patch -Np1 -i "${srcdir}"/0003-inc-MAX_PREFIXES_SUFFIXES-to-2048.patch
  patch -Np1 -i "${srcdir}"/0004-relocate.patch
  patch -Np1 -i "${srcdir}"/0005-windows-sub-dicts-paths.patch

  # See https://github.com/hunspell/hunspell/pull/389
  patch -Np1 -i "${srcdir}"/0006-Fix-for-tool-Munch-when-compiling-with-Mingw64-for-6.patch
  patch -Np1 -i "${srcdir}"/0007-Added-header-stddef-to-munch-and-unmunch.patch
  
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
