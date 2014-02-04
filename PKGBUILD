# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gtkmathview
pkgver=0.8.0
pkgrel=4
pkgdesc="C++ rendering engine for MathML documents"
arch=('i686' 'x86_64')
url="http://helm.cs.unibo.it/mml-widget/"
license=('LGPL3')
depends=('popt' 'gtk2' 't1lib' 'gmetadom' 'pangox-compat')
source=(http://helm.cs.unibo.it/mml-widget/sources/${pkgname}-${pkgver}.tar.gz
        gtkmathview-0.8.0-gcc43.patch
        gtkmathview-0.8.0-cond-t1.patch
        gtkmathview-0.8.0-gcc47.patch
        gtkmathview-0.8.0-includes.patch)
md5sums=('b53564e553728d4b69f7d366dfeb5299'
         '92eb2870c1922cbebd5566900cde220b'
         'a79a27e00908e75712bc9453b669fe61'
         '8c8620aee002b30975e1e175ef9af7a7'
         '4fc8daefbf27d49067b0c66bba54f428')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i ${srcdir}/gtkmathview-0.8.0-gcc43.patch
  patch -Np1 -i ${srcdir}/gtkmathview-0.8.0-gcc47.patch
  patch -Np1 -i ${srcdir}/gtkmathview-0.8.0-includes.patch
  patch -Np1 -i ${srcdir}/gtkmathview-0.8.0-cond-t1.patch
  
  # AM_BINRELOC missing, just ignore
  echo 'AC_DEFUN([AM_BINRELOC], [])' > acinclude.m4
  autoreconf -if
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --disable-static
  make LIBTOOL=/usr/bin/libtool
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR=${pkgdir}/ install
}

