# Maintainer: Whyme Lyu <callme5long@gmail.com>
# Contributor: Carlo De Pieri <depieri.carlo@gmail.com>
# Contributor: Tobias Kunze <r@rixx.de>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jason Chu <jason@archlinux.org>

pkgname=python37
pkgver=3.7.5
pkgrel=3
_pybasever=${pkgver%.*}
_pymajver=3
pkgdesc="Major release 3.7 of the Python high-level programming language"
arch=('x86_64')
license=('custom')
url="https://www.python.org/"
depends=('expat' 'bzip2' 'gdbm' 'openssl' 'libffi' 'zlib' 'libnsl')
makedepends=('tk' 'sqlite' 'valgrind' 'bluez-libs' 'mpdecimal' 'llvm' 'gdb' 'xorg-server-xvfb')
optdepends=('sqlite'
            'mpdecimal: for decimal'
            'xz: for lzma'
            'tk: for tkinter')
source=("https://www.python.org/ftp/python/${pkgver%rc*}/Python-${pkgver}.tar.xz"{,.asc}
        dont-make-libpython-readonly.patch
        0001-compileall-Fix-ddir-when-recursing.patch
        0002-smaller-pgo-test-suite.patch
        )
sha512sums=('f4f3879881f260f58dbb041fb0f2f210d4b70b02a739e41e50e6fea67d31855a7a29ce4ebef66bfde3d0edf54b946a48f78490f986da965357b835d4dbb3f414'
            'SKIP'
            '2ef96708d5b13ae2a3d2cc62c87b4780e60ecfce914e190564492def3a11d5e56977659f41c7f9d12266e58050c766bce4e2b5d50b708eb792794fa8357920c4'
            'ebd04c3b6d41321b1f0d439d356e0ce463760db55dc64109854c70d017cf56608aa19de9fc4a21bf840795ff202b4703444f9af8074b661780798c17e03089ff'
            '10db463924402b6f1d9631424397495e8be0419bc7f9ca6cd7325216433b2dfe512b6f6669626ff05a8e05a6013613660abee59fcb86e5483558b014687bfaa1'
            )
validpgpkeys=('0D96DF4D4110E5C43FBFB17F2D347EA6AA65421D')  # Ned Deily (Python release signing key) <nad@python.org>

prepare() {
  cd Python-${pkgver}

  # FS#45809
  patch -p1 -i ../dont-make-libpython-readonly.patch

  # FS#59997
  patch -p1 -i ../0001-compileall-Fix-ddir-when-recursing.patch

  # Backport https://bugs.python.org/issue36044 to 3.7
  patch -p1 -i ../0002-smaller-pgo-test-suite.patch

  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python|" Lib/cgi.py

  # Speed up LTO
  sed -i -e "s|-flto |-flto=4 |g" configure configure.ac

  # Ensure that we are using the system copy of various libraries (expat, libffi, and libmpdec),
  # rather than copies shipped in the tarball
  rm -r Modules/expat
  rm -r Modules/_ctypes/{darwin,libffi}*
  rm -r Modules/_decimal/libmpdec
}

build() {
  cd Python-${pkgver}

  # PGO should be done with -O3
  CFLAGS="${CFLAGS/-O2/-O3}"

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
              --with-ensurepip

  # Obtain next free server number for xvfb-run; this even works in a chroot environment.
  export servernum=99
  while ! xvfb-run -a -n "$servernum" /bin/true 2>/dev/null; do servernum=$((servernum+1)); done

  LC_CTYPE=en_US.UTF-8 xvfb-run -s "-screen 0 1280x720x24 -ac +extension GLX" -a -n "$servernum" make EXTRA_CFLAGS="$CFLAGS"
}

package() {
  cd Python-${pkgver}

  # PGO should be done with -O3
  CFLAGS="${CFLAGS/-O2/-O3}"

  # altinstall: /usr/bin/pythonX.Y but not /usr/bin/python or /usr/bin/pythonX
  make DESTDIR="${pkgdir}" EXTRA_CFLAGS="$CFLAGS" altinstall

  # Avoid conflicts with the main 'python' package, once Python 3.8 is standard.
  rm "${pkgdir}/usr/lib/libpython${_pymajver}.so"

  # Add missing pkgconfig stuff
  ln -s "python${_pybasever}m-config" "${pkgdir}/usr/bin/python${_pybasever}-config"

  # some useful "stuff" FS#46146
  install -dm755 "${pkgdir}"/usr/lib/python${_pybasever}/Tools/{i18n,scripts}
  install -m755 Tools/i18n/{msgfmt,pygettext}.py "${pkgdir}"/usr/lib/python${_pybasever}/Tools/i18n/
  install -m755 Tools/scripts/{README,*py} "${pkgdir}"/usr/lib/python${_pybasever}/Tools/scripts/

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
