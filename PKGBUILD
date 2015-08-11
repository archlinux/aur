# Maintainer: Alireza Savand <alireza.savand@gmail.com>
# Contributors:
#     * Christopher Arndt <chris@chrisarndt.de>
#     * Simon Sapin <simon.sapin@kozea.fr>


pkgname=python32
pkgver=3.2.6
pkgrel=1
_pybasever=3.2
pkgdesc="Next generation of the python high-level scripting language"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.python.org/"
depends=('expat' 'bzip2' 'gdbm' 'openssl' 'libffi' 'zlib')
makedepends=('tk' 'sqlite' 'valgrind')
optdepends=('tk: for tkinter' 'sqlite')
changelog=ChangeLog
source=("http://www.python.org/ftp/python/${pkgver%rc*}/Python-${pkgver}.tar.xz" "readline-6.3.patch")
sha256sums=('1d12b501819fd26afafbf8459be1aa279b56f032b4c15412de0a713ce0de7bdc'
            'fbd8a517726ec5d84e33e7f39bf721e3b0d08471d0cf905b830327b8aa959cc4')

build() {
  cd "${srcdir}/Python-${pkgver}"

  # patch readline module to work with readline >= 6.3
  # http://bugs.python.org/issue20374
  patch -p1 -i $srcdir/readline-6.3.patch

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
              --with-wide-unicode \
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

  # Work around a conflict with the current 'python' package.
  rm "${pkgdir}/usr/lib/libpython3.so"
  rm "${pkgdir}/usr/share/man/man1/python3.1"*

  # Fix FS#22552
  ln -sf ../../libpython${_pybasever}mu.so \
    "${pkgdir}/usr/lib/python${_pybasever}/config-${_pybasever}mu/libpython${_pybasever}mu.so"

  # Fix pycairo build
  ln -sf python3.2mu-config "${pkgdir}/usr/bin/python3.2-config"

  # Clean-up reference to build directory
  sed -i "s|$srcdir/Python-${pkgver}:||" "$pkgdir/usr/lib/python${_pybasever}/config-${_pybasever}mu/Makefile"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
