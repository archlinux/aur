# Maintainer: Daniel Milde <daniel@milde.cz>
# Co-Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Modified from extra/python; original contributors:
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jason@archlinux.org>

shopt -s extglob

pkgbase=python-git
pkgname=(python-git)
pkgver=3.12.0a0.r114486.91f40f3f78d
pkgrel=1
_pybasever=3.12
pkgdesc="Next generation of the python high-level scripting language"
arch=('x86_64')
license=('custom')
url="https://www.python.org/"
depends=('bzip2' 'expat' 'gdbm' 'libffi' 'libnsl' 'libxcrypt' 'openssl' 'zlib')
makedepends=('tk' 'sqlite' 'valgrind' 'bluez-libs' 'mpdecimal' 'xz' 'git' 'llvm' 'gdb' 'xorg-server-xvfb')
checkdepends=('ttf-font')
source=("git+https://github.com/python/cpython#branch=main")
sha512sums=('SKIP')

pkgver() {
  cd cpython
  printf "%s.r%s.%s" \
      "$_pybasever.0a0" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
}

prepare() {
  cd cpython

  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python|" Lib/cgi.py
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

package_python-git() {
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

  # some useful "stuff" FS#46146
  install -dm755 "${pkgdir}"/usr/lib/python${_pybasever}/Tools/{i18n,scripts}
  install -m755 Tools/i18n/{msgfmt,pygettext}.py "${pkgdir}"/usr/lib/python${_pybasever}/Tools/i18n/
  install -m755 Tools/scripts/{README,*py} "${pkgdir}"/usr/lib/python${_pybasever}/Tools/scripts/

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
