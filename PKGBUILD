# Maintainer: GalaxySnail <me+aur@glxys.nl>
# Contributor: Tobias Kunze <r@rixx.de>

pkgname=python313
pkgver=3.13.11
pkgrel=1
_pybasever=3.13
_pymajver=3
pkgdesc="Major release 3.13 of the Python programming language"
arch=('i686' 'x86_64')
license=('PSF-2.0')
url="https://www.python.org/"
depends=('bzip2' 'expat' 'gdbm' 'libffi' 'libnsl' 'libxcrypt' 'openssl' 'zlib' 'tzdata')
makedepends=('bluez-libs' 'mpdecimal' 'gdb')
optdepends=('sqlite' 'mpdecimal: for decimal' 'xz: for lzma' 'tk: for tkinter')
source=(https://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.xz)
sha256sums=('16ede7bb7cdbfa895d11b0642fa0e523f291e6487194d53cf6d3b338c3a17ea2')
validpgpkeys=(
    '0D96DF4D4110E5C43FBFB17F2D347EA6AA65421D'  # Ned Deily (Python release signing key) <nad@python.org>
    'E3FF2839C048B25C084DEBE9B26995E310250568'  # Łukasz Langa (GPG langa.pl) <lukasz@langa.pl>
)

prepare() {
  cd "${srcdir}/Python-${pkgver}"

  # Ensure that we are using the system copy of various libraries (expat and libmpdec),
  # rather than copies shipped in the tarball
  rm -r Modules/expat
  rm -r Modules/_decimal/libmpdec

  # use parallel LTO
  # https://github.com/python/cpython/pull/132258
  sed -i 's/\(LTOFLAGS=.*\) -flto-partition=none/\1/' configure
}

build() {
  cd "${srcdir}/Python-${pkgver}"

  ./configure --prefix=/usr \
              --enable-shared \
              --with-computed-gotos \
              --with-lto \
              --enable-ipv6 \
              --with-system-expat \
              --with-dbmliborder=gdbm:ndbm \
              --with-system-ffi \
              --with-system-libmpdec \
              --enable-loadable-sqlite-extensions \
              --without-ensurepip \
              --with-tzpath=/usr/share/zoneinfo

  make EXTRA_CFLAGS="$CFLAGS"
}

package() {
  cd "${srcdir}/Python-${pkgver}"
  # altinstall: /usr/bin/pythonX.Y but not /usr/bin/python or /usr/bin/pythonX
  make DESTDIR="${pkgdir}" altinstall maninstall

  # Split tests
  rm -r "$pkgdir"/usr/lib/python*/{test,idlelib/idle_test}

  # Avoid conflicts with the main 'python' package.
  rm -f "${pkgdir}/usr/lib/libpython${_pymajver}.so"
  rm -f "${pkgdir}/usr/share/man/man1/python${_pymajver}.1"

  # Clean-up reference to build directory
  sed -i "s|$srcdir/Python-${pkgver}:||" "$pkgdir/usr/lib/python${_pybasever}/config-${_pybasever}-${CARCH}-linux-gnu/Makefile"

  # Add useful scripts FS#46146
  install -dm755 "${pkgdir}"/usr/lib/python${_pybasever}/Tools/{i18n,scripts}
  install -m755 Tools/i18n/{msgfmt,pygettext}.py "${pkgdir}"/usr/lib/python${_pybasever}/Tools/i18n/
  install -m755 Tools/scripts/{README,*py} "${pkgdir}"/usr/lib/python${_pybasever}/Tools/scripts/

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
