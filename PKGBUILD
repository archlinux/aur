# Maintainer: Blair Bonnett <blair.bonnett@gmail.com>
# Based off python313 PKGBUILD by Tobias Kunze <r@rixx.de>

pkgname=python313-freethreaded
pkgver=3.13.14
pkgrel=1
_pyver=3.13.14
_pybasever=3.13
_pymajver=3
pkgdesc="Major release 3.13 of the Python high-level programming language (freethreading version without GIL)"
arch=('x86_64')
license=('PSF-2.0')
url="https://www.python.org/"

depends=(
  'bzip2'
  'expat'
  'gdbm'
  'libffi'
  'libnsl'
  'libxcrypt'
  'openssl'
  'zlib'
)
makedepends=(
  'bluez-libs'
  'gdb'
  'mpdecimal'
  'sqlite'
  'tk'
)
optdepends=(
  'mpdecimal: for decimal'
  'sqlite'
  'tk: for tkinter'
  'xz: for lzma'
)
options=(!emptydirs)

source=(
  "https://www.python.org/ftp/python/${_pyver}/Python-${pkgver}.tar.xz"{,.asc}
)
sha256sums=(
  '639e43243c620a308f968213df9e00f2f8f62332f7adbaa7a7eeb9783057c690'
  'SKIP'
)
validpgpkeys=(
  '7169605F62C751356D054A26A821E680E5FA6305'  # Thomas Wouters (3.13 release manager) <thomas@python.org>
)

prepare() {
  cd "${srcdir}/Python-${pkgver}"

  # Ensure that we are using the system copy of various libraries (expat, zlib and libffi),
  # rather than copies shipped in the tarball
  rm -rf Modules/expat
  rm -rf Modules/zlib
  rm -rf Modules/_ctypes/{darwin,libffi}*
  rm -rf Modules/_decimal/libmpdec
}

build() {
  cd "${srcdir}/Python-${pkgver}"

  CFLAGS="${CFLAGS} -fno-semantic-interposition -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer"
  ./configure ax_cv_c_float_words_bigendian=no \
              --prefix=/usr \
              --enable-shared \
              --with-computed-gotos \
              --with-lto \
              --disable-gil \
              --enable-ipv6 \
              --with-system-expat \
              --with-dbmliborder=gdbm:ndbm \
              --with-system-libmpdec \
              --enable-loadable-sqlite-extensions \
              --without-ensurepip \
              --with-tzpath=/usr/share/zoneinfo

  make EXTRA_CFLAGS="$CFLAGS"
}

package() {
  cd "${srcdir}/Python-${pkgver}"
  # altinstall: /usr/bin/pythonX.Y but not /usr/bin/python or /usr/bin/pythonX
  make DESTDIR="${pkgdir}" altinstall

  # Split tests
  rm -r "$pkgdir"/usr/lib/python*/{test,idlelib/idle_test}

  # Avoid conflicts with the main 'python' package.
  rm -f "${pkgdir}/usr/lib/libpython${_pymajver}.so"

  # Avoid conflicts with the python313 package.
  mv "${pkgdir}/usr/bin/idle${_pybasever}" "${pkgdir}/usr/bin/idle${_pybasever}t"
  mv "${pkgdir}/usr/bin/pydoc${_pybasever}" "${pkgdir}/usr/bin/pydoc${_pybasever}t"
  rm "${pkgdir}/usr/bin/python${_pybasever}"
  rm -r "${pkgdir}/usr/share/man"

  # Clean-up reference to build directory
  sed -i "s|$srcdir/Python-${pkgver}:||" "$pkgdir/usr/lib/python${_pybasever}t/config-${_pybasever}t-${CARCH}-linux-gnu/Makefile"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
