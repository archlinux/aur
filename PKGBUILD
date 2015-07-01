# Maintainer : Dr-Shadow <xxdrshadowxx@gmail.com>
# Contributor: xantares <xantares09 at hotmail dot com>
# Contributor: Ray Donnelly <mingw.android@gmail.com>

pkgname=mingw-w64-python2
pkgver=2.7.9
_pybasever=2.7
pkgrel=1
pkgdesc="A high-level scripting language (mingw-w64)"
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
makedepends=('mingw-w64-gcc' 'mingw-w64-pkg-config' "python2>=${pkgver}" 'wine')
options=('staticlibs' '!buildflags' '!strip')
source=("http://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.xz"
        'patches.tar.gz')
sha1sums=('3172f6e957713c2d9fca462cc16068222fd1b9d3'
          'c02170ef8291c56d4ab4978363761eb985da4ea3')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/Python-${pkgver}"

  # these are created by patches
  rm -f Modules/_ctypes/libffi_msvc/win32.S Python/fileblocks.c Misc/python-config.sh.in

  PATCHES=$(find "${srcdir}/${pkgver}" -maxdepth 1 -name "*.patch" | sort)
  for PATCH in $PATCHES; do
    patch -Np1 -i $PATCH
  done

  # run PGEN through wine
  sed -i "s|\\\$(PGEN) \\\$(GRAMMAR_INPUT)|wine \\\$(PGEN) \\\$(GRAMMAR_INPUT)|g" Makefile.pre.in

  autoreconf -vfi
  
  # Temporary workaround for FS#22322
  # See http://bugs.python.org/issue10835 for upstream report
  sed -i "/progname =/s/python/python${_pybasever}/" Python/pythonrun.c

  # Enable built-in SQLite module to load extensions (fix FS#22122)
  sed -i "/SQLITE_OMIT_LOAD_EXTENSION/d" setup.py

  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python2|" Lib/cgi.py

  sed -i "s/python2.3/python2/g" Lib/distutils/tests/test_build_scripts.py \
     Lib/distutils/tests/test_install_scripts.py Tools/scripts/gprof2html.py
  
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
    install -m 644 libpython${_pybasever}.a "$pkgdir"/usr/${_arch}/lib
    install -m 644 libpython${_pybasever}.dll.a "$pkgdir"/usr/${_arch}/lib
    rm -rf "$pkgdir"/usr/${_arch}/share
    rm "$pkgdir"/usr/${_arch}/bin/*.sh
    rm "$pkgdir"/usr/${_arch}/bin/2to3
    rm "$pkgdir"/usr/${_arch}/bin/python-config*
    rm "$pkgdir"/usr/${_arch}/bin/idle
    rm "$pkgdir"/usr/${_arch}/bin/pydoc
    rm "$pkgdir"/usr/${_arch}/bin/python.exe
    mv "${pkgdir}"/usr/${_arch}/bin/smtpd.py "${pkgdir}"/usr/${_arch}/lib/python${_pybasever}/
    rm "${pkgdir}"/usr/${_arch}/lib/pkgconfig/python.pc
    ${_arch}-strip "$pkgdir"/usr/${_arch}/bin/*.exe 
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
