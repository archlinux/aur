# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>
# Contributor: Rodolphe Breard <packages@what.tf>
# Contributor: Christopher Arndt <chris@chrisarndt.de>

pkgname=python33
pkgver=3.3.6
pkgrel=2
_pybasever=3.3
_pymajver=3
pkgdesc="Major release 3.3 of the Python high-level programming language"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.python.org/"
depends=('expat' 'bzip2' 'gdbm' 'openssl' 'libffi' 'zlib')
makedepends=('tk' 'sqlite' 'valgrind' 'bluez-libs' 'mpdecimal' 'hardening-wrapper')
optdepends=('mpdecimal: for decimal'
            'sqlite'
            'tk: for tkinter'
            'xz')
options=('!makeflags')
source=(http://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.xz
        python-3.3-ssl-nosslv3.patch)
sha256sums=('5226e4bf7a530c3ff2bcde0c94e0e09e59a8bcde0114fe0268bc925bdabb5d3f'
            'd54bc0ac72218b37c1c2f7a8f03f904a06c2270518a5f3b9e27e54578fe1fb04')

prepare() {
  cd "${srcdir}/Python-${pkgver}"

  patch -Np1 -i ${srcdir}/python-3.3-ssl-nosslv3.patch

  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python|" Lib/cgi.py

  # Ensure that we are using the system copy of various libraries (expat, zlib and libffi),
  # rather than copies shipped in the tarball
  rm -rf Modules/expat
  rm -rf Modules/zlib
  rm -rf Modules/_ctypes/{darwin,libffi}*
  rm -rf Modules/_decimal/libmpdec
}

build() {
  cd "${srcdir}/Python-${pkgver}"

  export CPPFLAGS="-DOPENSSL_NO_SSL3"
  ./configure --prefix=/usr \
              --enable-shared \
              --with-threads \
              --with-computed-gotos \
              --enable-ipv6 \
              --with-system-expat \
              --with-dbmliborder=gdbm:ndbm \
              --with-system-ffi \
              --with-system-libmpdec \
              --enable-loadable-sqlite-extensions

  make
}

check() {
  cd "${srcdir}/Python-${pkgver}"

  # make test
  LD_LIBRARY_PATH="${srcdir}/Python-${pkgver}":${LD_LIBRARY_PATH} \
                 "${srcdir}/Python-${pkgver}/python" -m test.regrtest -x \
                 test_distutils \
                 test_faulthandler \
                 test_ftplib \
                 test_ssl
}

package() {
  cd "${srcdir}/Python-${pkgver}"
  # altinstall: /usr/bin/pythonX.Y but not /usr/bin/python or /usr/bin/pythonX
  make DESTDIR="${pkgdir}" altinstall maninstall

  # Avoid conflicts with the main 'python' package.
  rm "${pkgdir}/usr/lib/libpython${_pymajver}.so"
  rm "${pkgdir}/usr/share/man/man1/python${_pymajver}.1"

  # fix FS#22552
  ln -sf ../../libpython${_pybasever}m.so \
    "${pkgdir}/usr/lib/python${_pybasever}/config-${_pybasever}m/libpython${_pybasever}m.so"

  # fix pycairo build
  ln -sf python${_pybasever}m-config "${pkgdir}/usr/bin/python${_pybasever}-config"

  # clean-up reference to build directory
  sed -i "s|$srcdir/Python-${pkgver}:||" "$pkgdir/usr/lib/python${_pybasever}/config-${_pybasever}m/Makefile"

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
