# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Upstream Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Maintainer: Fantix King <fantix.king at gmail.com>

_pkgbasename=libgcrypt
pkgname=libx32-$_pkgbasename
pkgver=1.5.0
pkgrel=1.1
pkgdesc="a general purpose crypto library based on the code used (x32 ABI)"
arch=(x86_64)
url="http://www.gnupg.org"
license=('LGPL')
depends=('libx32-libgpg-error>=1.7' $_pkgbasename)
makedepends=(gcc-multilib libtool-multilib)
options=(!libtool)
source=(ftp://ftp.gnupg.org/gcrypt/${_pkgbasename}/${_pkgbasename}-${pkgver}.tar.bz2
  #ftp://ftp.franken.de/pub/crypt/mirror/ftp.gnupg.org/gcrypt/libgcrypt/${_pkgbasename}-${pkgver}.tar.bz2
  libgcrypt-1.4.5-x32.patch
)
md5sums=('693f9c64d50c908bc4d6e01da3ff76d8'
         '6df87757efcbc17e289680ddaed956c7')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd ${srcdir}/${_pkgbasename}-${pkgver}

  patch -p1 -i ${srcdir}/libgcrypt-1.4.5-x32.patch

  # keep static library for , needed for cryptsetup
  ./configure --prefix=/usr --disable-padlock-support --libdir=/usr/libx32 --enable-shared
  make
}

package() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}
  make DESTDIR=${pkgdir} install

  rm -rf "${pkgdir}"/usr/{include,share,bin,sbin}
}
