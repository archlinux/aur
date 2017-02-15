# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=python-git
pkgver=3.7.0a0.r98682.f15fa87e5a
pkgrel=1
_pybasever=3.7
_pkgname=cpython
pkgdesc="Next generation of the python high-level scripting language"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.python.org/"
replaces=('python-hg')
conflicts=('python-hg')
depends=('expat' 'bzip2' 'gdbm' 'openssl' 'libffi' 'zlib')
makedepends=('tk>=8.6.0' 'sqlite' 'valgrind' 'bluez-libs' 'git')
optdepends=('tk: for tkinter' 'sqlite')
options=(debug !strip !makeflags)
source=("git+https://github.com/python/cpython#branch=master"
        'boot-flag.patch')
sha256sums=('SKIP'
            '940202895732185da4548b6a1fb01ad080cd188c21a149359eb178fdcfb613f9')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s.r%s.%s" \
      "3.7.0a0" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
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

  # http://bugs.python.org/issue23404
  patch -p1 -i ../boot-flag.patch
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

  # http://bugs.python.org/issue26662
  # `make touch` does not work with git clones: http://bugs.python.org/issue23404
  # make touch

  make BOOT='#'
}

package() {
  cd "${srcdir}/${_pkgname}"
  # altinstall: /usr/bin/pythonX.Y but not /usr/bin/python or /usr/bin/pythonX
  make BOOT='#' DESTDIR="${pkgdir}" altinstall maninstall

  # Work around a conflict with 3.4 the 'python' package.
  rm "${pkgdir}/usr/lib/libpython3.so"
  rm "${pkgdir}/usr/share/man/man1/python3.1"

  # Fix FS#22552
  ln -sf ../../libpython${_pybasever}m.so \
    "${pkgdir}/usr/lib/python${_pybasever}/config-${_pybasever}m-${CARCH}-linux-gnu/libpython${_pybasever}m.so"

  # Fix pycairo build
  ln -sf python3.7m-config "${pkgdir}/usr/bin/python3.7-config"

  # Clean-up reference to build directory
  sed -i "s|$srcdir/${_pkgname}:||" "$pkgdir/usr/lib/python${_pybasever}/config-${_pybasever}m-${CARCH}-linux-gnu/Makefile"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
