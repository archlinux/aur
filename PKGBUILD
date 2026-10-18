# $Id$
# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=giflib4
pkgver=4.2.3
pkgrel=3
pkgdesc="A library for reading and writing gif images (version 4)"
url="http://sourceforge.net/projects/giflib/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('glibc')
source=(http://downloads.sourceforge.net/sourceforge/giflib/giflib-${pkgver}.tar.bz2)
md5sums=('be1f5749c24644257a88c9f42429343d')

prepare() {
  cd giflib-${pkgver}
  # GCC 14+: implicit function declarations are errors
  sed -i 's|#include "gif_lib_private.h"|#include <stdlib.h>\n&|' lib/gif_hash.c
}

build() {
  cd giflib-${pkgver}
  ./configure --prefix=/usr --disable-static --includedir=/usr/include/giflib4 --libdir=/usr/lib/giflib4
  # only the library: doc/ needs DocBook validation and installs nothing, utilities are not packaged
  make -C lib
}

package() {
  cd giflib-${pkgver}
  make -C lib DESTDIR="${pkgdir}" install

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/giflib4/COPYING"
}
