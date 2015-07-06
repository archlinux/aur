# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jason@archlinux.org>

pkgname=python-hg
pkgver=3.4.0.b1.r87577.1fed50c8ea62
pkgrel=1
_pybasever=3.4
pkgdesc="Next generation of the python high-level scripting language (hg version)"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.python.org/"
depends=('expat' 'bzip2' 'gdbm' 'openssl' 'libffi' 'zlib')
makedepends=('tk>=8.6.0' 'sqlite' 'valgrind' 'bluez-libs' 'mercurial')
optdepends=('tk: for tkinter' 'sqlite')
provides=("python=${_pybasever}" 'python3' 'python-pip')
replaces=('python3' 'python-pip')
conflicts=('python' 'python-pip')
#options=('!makeflags')
source=("$pkgname"::'hg+http://hg.python.org/cpython')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s.r%s.%s" \
      "$(hg tags | awk 'NR==2 {print $1}' | sed -E 's/^v//;s/([a-z])/.\1/')" \
      "$(hg identify -n)" \
      "$(hg identify -i)"
}

prepare() {
  cd "${srcdir}/${pkgname}"

  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python|" Lib/cgi.py

  # Ensure that we are using the system copy of various libraries 
  # (expat, zlib and libffi), rather than copies shipped in the tarball
  rm -r Modules/expat
  rm -r Modules/zlib
  rm -r Modules/_ctypes/{darwin,libffi}*
}

build() {
  cd "${srcdir}/${pkgname}"

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

check() {
  cd "${srcdir}/${pkgname}"
  LD_LIBRARY_PATH="${srcdir}/${pkgname}":${LD_LIBRARY_PATH} \
     "${srcdir}/${pkgname}/python" -m test.regrtest -x test_posixpath test_logging
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install

  # Why are these not done by default...
  ln -sf python3               "${pkgdir}"/usr/bin/python
  ln -sf python3-config        "${pkgdir}"/usr/bin/python-config
  ln -sf idle3                 "${pkgdir}"/usr/bin/idle
  ln -sf pydoc3                "${pkgdir}"/usr/bin/pydoc
  ln -sf pip3                  "${pkgdir}"/usr/bin/pip
  ln -sf python${_pybasever}.1 "${pkgdir}"/usr/share/man/man1/python3.1
  ln -sf python${_pybasever}.1 "${pkgdir}"/usr/share/man/man1/python.1

  # Fix FS#22552
  ln -sf ../../libpython${_pybasever}m.so \
    "${pkgdir}/usr/lib/python${_pybasever}/config-${_pybasever}m/libpython${_pybasever}m.so"

  # Clean-up reference to build directory
  sed -i "s|${srcdir}/${pkgname}||" "${pkgdir}/usr/lib/python${_pybasever}/config-${_pybasever}m/Makefile"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
