pkgname=python-static
pkgver=3.10.5
pkgrel=1
_pybasever=${pkgver%.*}
pkgdesc="Next generation of the python high-level scripting language"
arch=('x86_64')
license=('custom')
url="https://www.python.org/"
depends=('bzip2' 'expat' 'gdbm' 'libffi' 'libnsl' 'libxcrypt' 'openssl' 'zlib')
makedepends=('tk' 'sqlite' 'bluez-libs' 'mpdecimal' 'llvm' 'gdb' 'xorg-server-xvfb' 'ttf-font')
source=("https://www.python.org/ftp/python/${pkgver%rc*}/Python-${pkgver}.tar.xz")
sha512sums=('aa7f58a9b31de9824185b3e7bfa7da0dcf64ae9e89840664eae9d98d9048a650fa012cd5b873a62ff44b65b856db86f095c4003117406ec5e9583ec5f7e78e90')
validpgpkeys=('0D96DF4D4110E5C43FBFB17F2D347EA6AA65421D'  # Ned Deily (Python release signing key) <nad@python.org>
              'E3FF2839C048B25C084DEBE9B26995E310250568'  # Łukasz Langa (GPG langa.pl) <lukasz@langa.pl>
              'A035C8C19219BA821ECEA86B64E628F8D684696D') # Pablo Galindo Salgado <pablogsal@gmail.com>

prepare() {
  cd Python-${pkgver}

  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python|" Lib/cgi.py

  # Ensure that we are using the system copy of various libraries (expat, libffi, and libmpdec),
  # rather than copies shipped in the tarball
  rm -r Modules/expat
  rm -r Modules/_ctypes/{darwin,libffi}*
  rm -r Modules/_decimal/libmpdec
}

build() {
  cd Python-${pkgver}

  # PGO should be done with -O3
  CFLAGS="${CFLAGS/-O2/-O3} -ffat-lto-objects"

  # Disable bundled pip & setuptools
  ./configure --prefix=/usr \
              --enable-static --disable-shared \
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
  cd Python-${pkgver}
  install -d "${pkgdir}"/usr/lib
  install -m644 ./libpython*.a "${pkgdir}"/usr/lib 
}

