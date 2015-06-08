# Contributor: Taylor Venable <taylor@metasyntax.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgname='bigloo'
pkgname="${_pkgname}-devel"
epoch=9
_pkgver='4.2a'
_pkgsuffix='alpha29May15'
pkgver="${_pkgver}_${_pkgsuffix}"
pkgrel=1
pkgdesc="Fast scheme compiler"
arch=('i686' 'x86_64')
url="http://www-sop.inria.fr/mimosa/fp/Bigloo/"
license=('GPL' 'LGPL')
depends=('openssl' 'sqlite3' 'avahi' 'libunistring' 'gmp' 'gstreamer0.10-base' 'mpg123' 'flac' 'libuv')
makedepends=('zip' 'emacs')
optdepends=('emacs: for bee'
'java-environment: for compiling into jvm')
provides=('bigloo=$pkgver')
conflicts=('bigloo')
options=('!makeflags' 'staticlibs' '!strip')
install=bigloo.install
source=("ftp://ftp-sop.inria.fr/indes/fp/Bigloo/${_pkgname}${_pkgver}-${_pkgsuffix}.tar.gz" 'satisfy-ldconfig.sh')
md5sums=('246a741a81de07a64f8ed1a8413d2026'
         'c253eb5651c81204f6c16b89c3c2cb6a')

prepare() {
  cd "${srcdir}/${_pkgname}${_pkgver}"
  sed -ri 's/ ?-Wl,-rpath=[^"]+"/"/' configure
}

build() {
  cd "${srcdir}/${_pkgname}${_pkgver}"

  CFLAGS+=" -fPIC" ./configure --prefix=/usr \
    --enable-ssl \
    --enable-sqlite \
    --enable-gstreamer \
    --enable-libuv --customlibuv=yes \
    --mandir=/usr/share/man \
    --infodir=/usr/share/info \
    --docdir=/usr/share/doc/bigloo \
    --strip=no \
    --sharedcompiler=yes
  make build compile-bee
}

check() {
  cd "${srcdir}/${_pkgname}${_pkgver}"
  make test
}

package() {
  cd "${srcdir}/${_pkgname}${_pkgver}"
  make DESTDIR="${pkgdir}" install install-bee
  make -C manuals DESTDIR="${pkgdir}" install-bee
  chmod 644 "${pkgdir}/usr/lib/${_pkgname}/${_pkgver%-*}"/*.a
  # Slake ldconfig's thirst for symlinks.
  find "${pkgdir}/usr/lib/${_pkgname}/${_pkgver%-*}" -type f -name '*_es-*.so' \
    -exec "${srcdir}/satisfy-ldconfig.sh" '{}' \;
}
