# Contributor: Taylor Venable <taylor@metasyntax.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgname='bigloo'
pkgname="${_pkgname}-devel"
epoch=31
_pkgver=4.3b
_pkgsuffix=
pkgver=${_pkgver}
pkgrel=4
pkgdesc="Fast scheme compiler"
arch=('i686' 'x86_64')
url="http://www-sop.inria.fr/mimosa/fp/Bigloo/"
license=('GPL' 'LGPL')
depends=('openssl' 'sqlite3' 'avahi' 'libunistring' 'gmp' 'libpulse' 'libuv' 'mpg123' 'flac' 'libphidget')
makedepends=('zip' 'emacs' 'gettext')
optdepends=('emacs: for bee'
	    'java-environment: for compiling into jvm')
provides=('bigloo=$pkgver')
conflicts=('bigloo')
options=('!makeflags' 'libtool' 'staticlibs' '!strip')
source=("ftp://ftp-sop.inria.fr/indes/fp/Bigloo/${_pkgname}${_pkgver}.tar.gz" "satisfy-ldconfig.sh")
sha256sums=('fb6cb08eb4221cc5471f706093cfb7d54bc5beebcbf2c3a1bade8f1ee7ba0d3e'
            'b45d2dc176f2b8c6496da9bfaad76d9398172dbef288984f6415824c1c93a4c2')

prepare() {
  cd ${_pkgname}${_pkgver}
  sed -ri 's/ ?-Wl,-rpath=[^"]+"/"/' configure
}

build() {
  cd ${_pkgname}${_pkgver}

  CFLAGS+=" -fPIC" ./configure --prefix=/usr \
    --disable-ssl \
    --enable-sqlite \
    --enable-alsa \
    --disable-gstreamer \
    --enable-libuv \
    --mandir=/usr/share/man \
    --infodir=/usr/share/info \
    --docdir=/usr/share/doc/bigloo \
    --strip=no
  make
  make compile-bee
}

#check() {
#  cd ${_pkgname}${_pkgver}
#  make test
#}

package() {
  cd ${_pkgname}${_pkgver}
  make DESTDIR="${pkgdir}" install install-bee
  make -C manuals DESTDIR="${pkgdir}" install-bee
  chmod 644 "${pkgdir}/usr/lib/${_pkgname}/${_pkgver}"/*.a
}
