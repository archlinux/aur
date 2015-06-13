# Maintainer: Samuel Damashek <samuel.damashek@gmail.com>
# Based on python33 PKGBUILD (g.schulz)

pkgname=python35
pkgver=3.5.0b2
pkgrel=1
_pybasever=3.5
pkgdesc="Next generation of the python high-level scripting language"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.python.org/"
depends=('expat' 'bzip2' 'gdbm' 'openssl' 'libffi' 'zlib')
makedepends=('tk' 'sqlite' 'valgrind')
optdepends=('tk: for tkinter' 'sqlite')
options=('!makeflags')
source=(http://www.python.org/ftp/python/${pkgver%b*}/Python-${pkgver}.tar.xz)
sha256sums=('8bbbe3e574773971a74b2ae11c9712c0b6e6c3287ab63763a3e3e868511b0953')

build() {
  cd "${srcdir}/Python-${pkgver}"

  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python|" Lib/cgi.py

  # Ensure that we are using the system copy of various libraries (expat, zlib and libffi),
  # rather than copies shipped in the tarball
  rm -rf Modules/expat
  rm -rf Modules/zlib
  rm -rf Modules/_ctypes/{darwin,libffi}*

  ./configure --prefix=/usr \
              --enable-shared \
              --with-threads \
              --with-computed-gotos \
              --enable-ipv6 \
              --with-valgrind \
              --with-system-expat \
              --with-dbmliborder=gdbm:ndbm \
              --with-system-ffi

  make
}

# XXX disabled
check_DISABLED() {
  cd "${srcdir}/Python-${pkgver}"
  LD_LIBRARY_PATH="${srcdir}/Python-${pkgver}":${LD_LIBRARY_PATH} \
     "${srcdir}/Python-${pkgver}/python" -m test.regrtest -x test_distutils test_site \
     test_urllib test_uuid test_pydoc
}

package() {
  cd "${srcdir}/Python-${pkgver}"
  # altinstall: /usr/bin/pythonX.Y but not /usr/bin/python or /usr/bin/pythonX
  make DESTDIR="${pkgdir}" altinstall maninstall

  # Work around a conflict with 3.4 the 'python' package.
  rm "${pkgdir}/usr/lib/libpython3.so"
  rm "${pkgdir}/usr/share/man/man1/python3.1"

  # Fix FS#22552
  ln -sf ../../libpython${_pybasever}m.so \
    "${pkgdir}/usr/lib/python${_pybasever}/config-${_pybasever}m/libpython${_pybasever}m.so"

  # Fix pycairo build
  ln -sf python3.5m-config "${pkgdir}/usr/bin/python3.5-config"

  # Clean-up reference to build directory
  sed -i "s|$srcdir/Python-${pkgver}:||" "$pkgdir/usr/lib/python${_pybasever}/config-${_pybasever}m/Makefile"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
