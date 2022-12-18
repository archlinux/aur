# Maintainer: BlackCatDevel0per <bcdev@mail.ru>
# https://github.com/BlackCatDevel0per

pkgname=python3816
pkgver=3.8.16
pkgrel=3
_pybasever=3.8
_pymajver=3
pkgdesc="Major release 3.8 of the Python high-level programming language"
arch=('aarch64' 'i686' 'x86_64')
license=('custom')
url="https://www.python.org/"
depends=('expat' 'bzip2' 'gdbm' 'openssl' 'libffi' 'zlib')
makedepends=('gnupg' 'make' 'patch' 'sqlite' 'bluez-libs' 'mpdecimal')
optdepends=('tk: for tkinter' 'sqlite')
source=(
    https://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.xz
    https://www.python.org/ftp/python/${pkgver}/Python-${pkgver}.tar.xz.asc
    mpdecimal_cy3816.patch
)
sha256sums=('d85dbb3774132473d8081dcb158f34a10ccad7a90b96c7e50ea4bb61f5ce4562'
            'SKIP'
            'a44c461ae2caf4b4483c3bfbef3d5d140d528e163ef72084cf5d5afea75e298e'
)
validpgpkeys=('E3FF2839C048B25C084DEBE9B26995E310250568')
provides=("python=$pkgver")

# import gpg key to verify Python sources..
gpg --recv-keys B26995E310250568

prepare() {
  cd "${srcdir}/Python-${pkgver}"

  patch -p1 -i "${srcdir}/mpdecimal_cy3816.patch"

  # FS#23997
  sed -i -e "s|^#.* /usr/local/bin/python|#!/usr/bin/python|" Lib/cgi.py

  # Ensure that we are using the system copy of various libraries (expat, zlib and libffi),
  # rather than copies shipped in the tarball
  rm -rf Modules/expat
  rm -rf Modules/zlib
  rm -rf Modules/_ctypes/{darwin,libffi}*
  rm -rf Modules/_decimal/libmpdec
}

build() {
  cd "${srcdir}/Python-${pkgver}"

  # for arch-termux try:
  # --with-ipc=tcp

  CFLAGS=-DOPENSSL_NO_SSL2 ./configure --prefix=/usr \
              --enable-shared \
	      --enable-optimizations \
              --with-computed-gotos \
              --enable-ipv6 \
              --with-system-expat \
              --with-dbmliborder=gdbm:ndbm \
              --with-system-libmpdec \
              --enable-loadable-sqlite-extensions \
	      --without-ensurepip

  make -j $(nproc --all)
}

package() {
  cd "${srcdir}/Python-${pkgver}"
  # altinstall: /usr/bin/pythonX.Y but not /usr/bin/python or /usr/bin/pythonX
  make DESTDIR="${pkgdir}" altinstall maninstall

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

  # Remove gpg key..
  gpg --delete-key --batch --yes 'Łukasz Langa'
}
