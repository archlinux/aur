pkgname=python30
pkgver=3.0.1
pkgrel=1
_pybasever=3.0
pkgdesc="Next generation of the python high-level scripting language"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.python.org/"
depends=('expat' 'bzip2' 'gdbm' 'openssl' 'libffi' 'zlib')
makedepends=('tk' 'sqlite' 'valgrind')
optdepends=('tk: for tkinter' 'sqlite')
provides=('python3')
replaces=('python3')
options=('!makeflags')
source=(http://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.bz2)
sha256sums=('91afb6ac16d3d22bc6bfbc80726dc85ede32bf838f660cc67016c7d0a7079add')

build() {
  cd "${srcdir}/Python-${pkgver}"

  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python|" Lib/cgi.py

  # Ensure that we are using the system copy of various libraries
  # (expat, zlib), rather than copies shipped in the tarball
  rm -r Modules/expat
  rm -r Modules/zlib

  ./configure --prefix=/usr \
              --enable-shared \
              --with-threads \
              --with-computed-gotos \
              --enable-ipv6 \
              --with-valgrind \
              --with-system-expat \
              --with-dbmliborder=gdbm:ndbm \
              --with-system-ffi

  # Use the hg revision, fixes build process
  make SVNVERSION=51576
}

check_DISABLED() {
  cd "${srcdir}/Python-${pkgver}"
  LD_LIBRARY_PATH="${srcdir}/Python-${pkgver}":${LD_LIBRARY_PATH} \
     "${srcdir}/Python-${pkgver}/python" -m test.regrtest -x test_distutils test_site \
     test_urllib test_uuid test_pydoc
}

package() {
  cd "${srcdir}/Python-${pkgver}"
  make DESTDIR="${pkgdir}" altinstall maninstall

  # fix conflicts with python
  mv "${pkgdir}"/usr/bin/idle{,-3.0}
  mv "${pkgdir}"/usr/bin/pydoc{,-3.0}
  mv "${pkgdir}"/usr/bin/2to3{,-3.0}
  # Make it more clear smtpd.py is from an old version
  mv "${pkgdir}"/usr/bin/smtpd{,${_pybasever}}.py

  # Fix FS#22552
  ln -sf ../../libpython${_pybasever}.so \
    ${pkgdir}/usr/lib/python${_pybasever}/config/libpython${_pybasever}.so

  # Clean-up reference to build directory
  sed -i "s|$srcdir/Python-${pkgver}:||" "$pkgdir/usr/lib/python${_pybasever}/config/Makefile"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
