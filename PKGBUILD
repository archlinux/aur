# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=python-hg
pkgver=3.6.0a0.r101162+.f4c6dab59cd8+
pkgrel=1
_pybasever=3.6
_pkgname=cpython
pkgdesc="Next generation of the python high-level scripting language"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.python.org/"
depends=('expat' 'bzip2' 'gdbm' 'openssl' 'libffi' 'zlib')
makedepends=('tk>=8.6.0' 'sqlite' 'valgrind' 'bluez-libs' 'mercurial')
optdepends=('tk: for tkinter' 'sqlite')
options=(debug !strip !makeflags)
source=("hg+https://hg.python.org/cpython#branch=default")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s.r%s.%s" \
      "3.6.0a0" \
      "$(hg identify -n)" \
      "$(hg identify -i)"
      #"$(hg tags | awk 'NR==2 {print $1}' | sed -E 's/^v//;s/([a-z])/.\1/')" \
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python|" Lib/cgi.py

  # Ensure that we are using the system copy of various libraries (expat, zlib and libffi),
  # rather than copies shipped in the tarball
  rm -rf Modules/expat
  rm -rf Modules/zlib
  rm -rf Modules/_ctypes/{darwin,libffi}*
}

build() {
  cd "${srcdir}/${_pkgname}"

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

package() {
  cd "${srcdir}/${_pkgname}"
  # altinstall: /usr/bin/pythonX.Y but not /usr/bin/python or /usr/bin/pythonX
  make DESTDIR="${pkgdir}" altinstall maninstall

  # Work around a conflict with 3.4 the 'python' package.
  rm "${pkgdir}/usr/lib/libpython3.so"
  rm "${pkgdir}/usr/share/man/man1/python3.1"

  # Fix FS#22552
  ln -sf ../../libpython${_pybasever}m.so \
    "${pkgdir}/usr/lib/python${_pybasever}/config-${_pybasever}m/libpython${_pybasever}m.so"

  # Fix pycairo build
  ln -sf python3.6m-config "${pkgdir}/usr/bin/python3.6-config"

  # Clean-up reference to build directory
  sed -i "s|$srcdir/${_pkgname}:||" "$pkgdir/usr/lib/python${_pybasever}/config-${_pybasever}m/Makefile"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
