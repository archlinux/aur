# $Id$
# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jason@archlinux.org>

pkgname=python3.6
pkgver=3.6.6
pkgrel=1
_pybasever=3.6
pkgdesc="Next generation of the python high-level scripting language"
arch=('x86_64')
license=('custom')
url="http://www.python.org/"
depends=('expat' 'bzip2' 'gdbm' 'openssl' 'libffi' 'zlib' 'libnsl')
makedepends=('tk' 'sqlite' 'valgrind' 'bluez-libs' 'mpdecimal' 'llvm' 'gdb' 'xorg-server-xvfb')
optdepends=('python-setuptools'
            'python-pip'
            'sqlite'
            'mpdecimal: for decimal'
            'xz: for lzma'
            'tk: for tkinter')
provides=('python3')
source=("https://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.xz"
        dont-make-libpython-readonly.patch)
sha512sums=('c71f87c5906e770322a14cacad228655659f782207db826320449d12bf86091c3662f317e1773158dec52f8b052eaedfb4c03b561cc2a6cfcd381597fd2d2b04'
            'SKIP')
validpgpkeys=('0D96DF4D4110E5C43FBFB17F2D347EA6AA65421D')  # Ned Deily (Python release signing key) <nad@python.org>

prepare() {
  cd Python-${pkgver}

  # FS#45809
  patch -p1 -i ../dont-make-libpython-readonly.patch

  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python3.6|" Lib/cgi.py

  # Ensure that we are using the system copy of various libraries (expat, zlib, libffi, and libmpdec),
  # rather than copies shipped in the tarball
  rm -r Modules/expat
  rm -r Modules/zlib
  rm -r Modules/_ctypes/{darwin,libffi}*
  rm -r Modules/_decimal/libmpdec
}

build() {
  cd Python-${pkgver}

  # Disable bundled pip & setuptools
  ./configure --prefix=/usr \
              --enable-shared \
              --with-threads \
              --with-computed-gotos \
              --with-lto \
              --enable-ipv6 \
              --with-system-expat \
              --with-dbmliborder=gdbm:ndbm \
              --with-system-ffi \
              --with-system-libmpdec \
              --enable-loadable-sqlite-extensions \
              --without-ensurepip

  # Obtain next free server number for xvfb-run; this even works in a chroot environment.
  export servernum=99
  while ! xvfb-run -a -n "$servernum" /bin/true 2>/dev/null; do servernum=$((servernum+1)); done

  LC_CTYPE=en_US.UTF-8 xvfb-run -s "-screen 0 1280x720x24 -ac +extension GLX" -a -n "$servernum" make EXTRA_CFLAGS="$CFLAGS"
}

package() {
  cd Python-${pkgver}

  # Hack to avoid building again
  sed -i 's/^all:.*$/all: build_all/' Makefile

  make DESTDIR="${pkgdir}" EXTRA_CFLAGS="$CFLAGS" install

  rm -f "${pkgdir}"/usr/share/man/man1/python3.1
  rm -f "${pkgdir}"/usr/lib/libpython3.so
  rm -f "${pkgdir}"/usr/lib/pkgconfig/python3.pc
  rm -rfv "${pkgdir}"/usr/lib/python3.6/test
  rm -f "${pkgdir}"/usr/bin/python3
  rm -f "${pkgdir}"/usr/bin/python3-config
  rm -f "${pkgdir}"/usr/bin/idle3
  rm -f "${pkgdir}"/usr/bin/pydoc3
  rm -f "${pkgdir}"/usr/bin/2to3
  rm -f "${pkgdir}"/usr/bin/pyvenv

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
