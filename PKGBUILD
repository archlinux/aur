# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>
# Contributor: Alireza Savand <alireza.savand at gmail.com>
# Contributor: Christopher Arndt <chris at chrisarndt.de>
# Contributor: Simon Sapin <simon.sapin at kozea.fr>
pkgname=python32
pkgver=3.2.6
pkgrel=4
_pybasever=3.2
pkgdesc="Next generation of the python high-level scripting language"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.python.org/"
provides=("python=$pkgver")
depends=('expat' 'bzip2' 'gdbm' 'openssl-1.0' 'libffi' 'zlib')
makedepends=('tk' 'sqlite' 'valgrind' 'gcc11')
optdepends=('tk: for tkinter' 'sqlite')
changelog=ChangeLog
source=("http://www.python.org/ftp/python/${pkgver%rc*}/Python-${pkgver}.tar.xz"
        "readline-6.3.patch"
        "openssl-1.0.2g.patch")
sha256sums=('1d12b501819fd26afafbf8459be1aa279b56f032b4c15412de0a713ce0de7bdc'
            'fbd8a517726ec5d84e33e7f39bf721e3b0d08471d0cf905b830327b8aa959cc4'
            '707078f2efe9548fb6c512160013f1b155830c5842553ee664ce426ad5c065cc')

build() {
  cd "${srcdir}/Python-${pkgver}"

  # patch readline module to work with readline >= 6.3
  # http://bugs.python.org/issue20374
  patch -p1 -i $srcdir/readline-6.3.patch

  # SSLv3 is disabled by default since OpenSSL 1.0.2g
  patch -p1 -i $srcdir/openssl-1.0.2g.patch

  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python|" Lib/cgi.py

  # Fix shebangs
  find -name '*.py*' \
       -exec sed -ri '1s/^(#!.*python)3?\s*$/\1'$_pybasever'/' '{}' \;

  # Ensure that we are using the system copy of various libraries (expat, zlib and libffi),
  # rather than copies shipped in the tarball
  rm -rf Modules/expat
  rm -rf Modules/zlib
  rm -rf Modules/_ctypes/{darwin,libffi}*

  export CPPFLAGS="-I/usr/include/openssl-1.0"
  export LDFLAGS="-L/usr/lib/openssl-1.0"
  export CC=gcc-11
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
