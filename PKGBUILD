# Maintainer: a821 at (nospam) mail de
# Contributor: Daniel Milde <daniel@milde.cz>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>
# Modified from extra/python; original contributors:
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jason@archlinux.org>

shopt -s extglob

pkgname=python-git
pkgver=3.14.0a3.r78.gaeb9b65aa26
pkgrel=1
pkgdesc="The Python programming language"
arch=('x86_64')
license=('PSF-2.0')
url="https://www.python.org/"
depends=('bzip2' 'expat' 'gdbm' 'libffi' 'libnsl' 'libxcrypt' 'openssl' 'zlib' 'tzdata' 'mpdecimal')
makedepends=('tk' 'sqlite' 'bluez-libs' 'git' 'llvm' 'gdb' 'xorg-server-xvfb' 'ttf-font')
source=("git+https://github.com/python/cpython#branch=main")
sha512sums=('SKIP')

pkgver() {
  cd cpython
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
  cd cpython

  # Ensure that we are using the system copy of various libraries (expat, libffi, and libmpdec),
  # rather than copies shipped in the tarball
  rm -r Modules/expat
  rm -r Modules/_decimal/libmpdec
}

build() {
  cd cpython

  # PGO should be done with -O3
  CFLAGS="${CFLAGS/-O2/-O3} -ffat-lto-objects"

  # Disable bundled pip & setuptools
  ./configure --prefix=/usr \
              --enable-shared \
              --with-computed-gotos \
              --enable-optimizations \
              --with-lto \
              --enable-ipv6 \
              --with-system-expat \
              --with-dbmliborder=gdbm:ndbm \
              --with-system-ffi \
              --with-system-libmpdec \
              --enable-loadable-sqlite-extensions \
              --without-ensurepip \
              --with-tzpath=/usr/share/zoneinfo

  # Obtain next free server number for xvfb-run; this even works in a chroot environment.
  export servernum=99
  while ! xvfb-run -a -n "$servernum" /bin/true 2>/dev/null; do servernum=$((servernum+1)); done

  LC_CTYPE=en_US.UTF-8 xvfb-run -s "-screen 0 1920x1080x16 -ac +extension GLX" -a -n "$servernum" make EXTRA_CFLAGS="$CFLAGS"
}

package() {
  optdepends=('sqlite'
              'mpdecimal: for decimal'
              'xz: for lzma'
              'tk: for tkinter')

  cd cpython

  # Hack to avoid building again
  sed -i 's/^all:.*$/all: build_all/' Makefile

  # PGO should be done with -O3
  CFLAGS="${CFLAGS/-O2/-O3}"

  make DESTDIR="${pkgdir}" EXTRA_CFLAGS="$CFLAGS" ENSUREPIP=install altinstall maninstall

  # Work around a conflict with the 'python' package.
  rm "${pkgdir}/usr/lib/libpython3.so"
  rm "${pkgdir}/usr/share/man/man1/python3.1"

  local _pybasever=$(sed -n 's/^VERSION=//p' configure)

  # some useful "stuff" FS#46146
  install -dm755 "${pkgdir}"/usr/lib/python${_pybasever}/Tools/{i18n,scripts}
  install -m755 Tools/i18n/{msgfmt,pygettext}.py "${pkgdir}"/usr/lib/python${_pybasever}/Tools/i18n/
  install -m755 Tools/scripts/{README,*py} "${pkgdir}"/usr/lib/python${_pybasever}/Tools/scripts/
}
