# Maintainer: Francisco Demartino <demartino.francisco@gmail.com>
# Contributor: xantares <xantares09 at hotmail dot com>
# Contributor: Ray Donnelly <mingw.android@gmail.com>
# Contributor: Dr-Shadow <kerdiles.robin@gmail.com>

pkgname=mingw-w64-python
pkgver=3.4.3
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
         'mingw-w64-libffi'
         'mingw-w64-openssl'
         'mingw-w64-readline'
         'mingw-w64-zlib'
         'mingw-w64-xz')

makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')

source=("http://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.xz"
        'patches.tar.gz')
sha1sums=('7ca5cd664598bea96eec105aa6453223bb6b4456'
          'f4b0b6f86eb86be2d4c03de80f8bce2091b14193')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/Python-${pkgver}"

  # these are created by patches
  rm -f Misc/config_mingw Misc/cross_mingw32 Python/fileblocks.c

  PATCHES=$(find "${srcdir}/${pkgver}" -maxdepth 1 -name "*.patch" | sort)
  for PATCH in $PATCHES; do
    patch -Np1 -i $PATCH
  done

  autoreconf -vfi

  touch Include/graminit.h
  touch Python/graminit.c
  touch Parser/Python.asdl
  touch Parser/asdl.py
  touch Parser/asdl_c.py
  touch Include/Python-ast.h
  touch Python/Python-ast.c
  echo \"\" > Parser/pgen.stamp

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

    # export LIBFFI_INCLUDEDIR=`${_arch}-pkg-config libffi --cflags-only-I | sed "s|\-I||g"`
    ${_arch}-configure \
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
