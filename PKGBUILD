# Maintainer: xantares <xantares09 at hotmail dot com>
# Contributor: Ray Donnelly <mingw.android@gmail.com>

pkgname=mingw-w64-python
pkgver=3.4.2
_pybasever=3.4
pkgrel=1
pkgdesc="Next generation of the python high-level scripting language (mingw-w64)"
arch=('any')
license=('PSF')
url="http://www.python.org/"
depends=('mingw-w64-crt'
         'mingw-w64-expat'
	 'mingw-w64-bzip2'
	 'mingw-w64-gdbm'
	 'mingw-w64-openssl'
	 'mingw-w64-libffi'
	 'mingw-w64-zlib')
makedepends=('mingw-w64-gcc' 'mingw-w64-pkg-config' "python>=${pkgver}" 'wine')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.xz"
        'patches.tar.gz')
sha1sums=('0727d8a8498733baabe6f51632b9bab0cbaa9ada'
          '72f1405420d4d756c90eee77f630c50e52234a21')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/Python-${pkgver}"

  # these are created by patches
  rm -f Misc/config_mingw Misc/cross_mingw32 Python/fileblocks.c

  PATCHES=$(find "${srcdir}/${pkgver}" -maxdepth 1 -name "*.patch" | sort)
  for PATCH in $PATCHES; do
    patch -Np1 -i $PATCH
  done

  # run PGEN through wine
  sed -i "s|\\\$(PGEN) \\\$(GRAMMAR_INPUT)|wine \\\$(PGEN) \\\$(GRAMMAR_INPUT)|g" Makefile.pre.in

  autoreconf -vfi

  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python|" Lib/cgi.py

  # Ensure that we are using the system copy of various libraries (expat, zlib and libffi),
  # rather than copies shipped in the tarball
  rm -r Modules/expat
  rm -r Modules/zlib
  rm -r Modules/_ctypes/{darwin,libffi}*
}

build() {
  cd "${srcdir}/Python-${pkgver}"
  unset LDFLAGS
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"
    export LIBFFI_INCLUDEDIR=`${_arch}-pkg-config libffi --cflags-only-I | sed "s|\-I||g"`
    ../configure \
      --prefix=/usr/${_arch} \
      --host=${_arch} \
      --build=$CHOST \
      --enable-shared \
      --with-threads \
      --with-computed-gotos \
      --with-system-expat \
      --with-dbmliborder=gdbm:ndbm \
      --with-system-ffi    
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/Python-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    chmod 755 "$pkgdir"/usr/${_arch}/bin/*.dll
    install -m 644 libpython${_pybasever}m.a "$pkgdir"/usr/${_arch}/lib
    install -m 644 libpython${_pybasever}m.dll.a "$pkgdir"/usr/${_arch}/lib
    rm -rf "$pkgdir"/usr/${_arch}/share
    rm "$pkgdir"/usr/${_arch}/bin/2to3*
    rm "$pkgdir"/usr/${_arch}/bin/idle*
    rm "$pkgdir"/usr/${_arch}/bin/pydoc*
    rm "$pkgdir"/usr/${_arch}/bin/pyvenv*
    ${_arch}-strip "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
