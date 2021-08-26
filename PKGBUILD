# Maintainer: Bernat Gabor <gaborjbernat@gmail.com>

pkgname=("python-quick-build-git")
pkgdesc="Next generation of the python high-level scripting language"
pkgver=3.11.0a0.r110743.806e25fd317
pkgrel=3
_pymajver=3
_pybasever=3.11
arch=("x86_64")
url="https://www.python.org/"
license=("custom")
depends=(
  "expat"
  "bzip2"
  "gdbm"
  "openssl"
  "libffi"
  "zlib"
  "libnsl"
)
makedepends=(
  "tk"
  "sqlite"
  "valgrind"
  "bluez-libs"
  "mpdecimal"
  "xz"
  "git"
  "llvm"
  "gdb"
)
checkdepends=("ttf-font")
source=("cpython-git::git+https://github.com/python/cpython#branch=main")
sha512sums=("SKIP")
conflicts=("python-git")
provides=("python${_pybasever}")

pkgver() {
  cd cpython-git
  printf "%s.r%s.%s" "$_pybasever.0a0" "$(git rev-list --count HEAD)"  "$(git rev-parse --short HEAD)"
}

prepare() {
  cd cpython-git
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python|" Lib/cgi.py
  rm -rf Modules/expat
  rm -rf Modules/zlib
  rm -rf Modules/_ctypes/{darwin,libffi}*
  rm -rf Modules/_decimal/libmpdec
}

build() {
  cd cpython-git
  CFLAGS=-DOPENSSL_NO_SSL2 ./configure --prefix=/usr \
              --enable-shared \
              --with-threads \
              --with-computed-gotos \
              --enable-ipv6 \
              --with-system-expat \
              --with-dbmliborder=gdbm:ndbm \
              --with-system-libmpdec \
              --enable-loadable-sqlite-extensions \
              --without-ensurepip
  make
}

package() {
  optdepends=(
    "sqlite"
    "mpdecimal: for decimal"
    "xz: for lzma"
    "tk: for tkinter"
  )
  cd cpython-git
  # altinstall: /usr/bin/pythonX.Y but not /usr/bin/python or /usr/bin/pythonX
  make DESTDIR="${pkgdir}" altinstall maninstall

  # Avoid conflicts with the main 'python' package.
  rm -f "${pkgdir}/usr/lib/libpython${_pymajver}.so"
  rm -f "${pkgdir}/usr/share/man/man1/python${_pymajver}.1"
  rm -rf "${pkgdir}/usr/lib/python${_pybasever}/test"

  # Fix FS#22552
  ln -sf ../../libpython${_pybasever}m.so \
    "${pkgdir}/usr/lib/python${_pybasever}/config-${_pybasever}-${CARCH}-linux-gnu/libpython${_pybasever}m.so"

  # Fix pycairo build
  ln -sf python${_pybasever}m-config "${pkgdir}/usr/bin/python${_pybasever}-config"

  # Clean-up reference to build directory
  sed -i "s|$srcdir/Python-${pkgver}:||" "$pkgdir/usr/lib/python${_pybasever}/config-${_pybasever}-${CARCH}-linux-gnu/Makefile"

  # Add useful scripts FS#46146
  install -dm755 "${pkgdir}"/usr/lib/python${_pybasever}/Tools/{i18n,scripts}
  install -m755 Tools/i18n/{msgfmt,pygettext}.py "${pkgdir}"/usr/lib/python${_pybasever}/Tools/i18n/
  install -m755 Tools/scripts/{README,*py} "${pkgdir}"/usr/lib/python${_pybasever}/Tools/scripts/

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
