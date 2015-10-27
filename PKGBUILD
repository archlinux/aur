# Contributor: Taylor Venable <taylor@metasyntax.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgname='bigloo'
pkgname="${_pkgname}-devel"
epoch=12
pkgver='4.2b'
_pkgsuffix=''
#pkgver="${_pkgver}_${_pkgsuffix}"
pkgrel=1
pkgdesc="Fast scheme compiler"
arch=('i686' 'x86_64')
url="http://www-sop.inria.fr/mimosa/fp/Bigloo/"
license=('GPL' 'LGPL')
depends=('openssl' 'sqlite3' 'avahi' 'libunistring' 'gmp' 'gstreamer0.10-base' 'mpg123' 'flac')
makedepends=('zip' 'emacs')
optdepends=('emacs: for bee'
	    'java-environment: for compiling into jvm')
provides=('bigloo=$pkgver')
conflicts=('bigloo')
options=('!makeflags' 'staticlibs' '!strip')
install=bigloo.install
source=("ftp://ftp-sop.inria.fr/indes/fp/Bigloo/${_pkgname}${pkgver}.tar.gz" "satisfy-ldconfig.sh")
md5sums=('c9662c11b5d9f85f7b6ff7299e81c215'
         'c253eb5651c81204f6c16b89c3c2cb6a')

prepare() {
  cd "${srcdir}/${_pkgname}${pkgver}"
  sed -ri 's/ ?-Wl,-rpath=[^"]+"/"/' configure
}

build() {
  cd "${srcdir}/${_pkgname}${pkgver}"

  CFLAGS+=" -fPIC" ./configure --prefix=/usr \
    --enable-ssl \
    --enable-sqlite \
    --enable-alsa \
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
  cd "${srcdir}/${_pkgname}${pkgver}"
  make test
}

package() {
  cd "${srcdir}/${_pkgname}${pkgver}"
  make DESTDIR="${pkgdir}" install install-bee
  make -C manuals DESTDIR="${pkgdir}" install-bee
  chmod 644 "${pkgdir}/usr/lib/${_pkgname}/${pkgver%-*}"/*.a
  # Slake ldconfig's thirst for symlinks.
  find "${pkgdir}/usr/lib/${_pkgname}/${pkgver%-*}" -type f -name '*_es-*.so' \
    -exec "${srcdir}/satisfy-ldconfig.sh" '{}' \;
}
