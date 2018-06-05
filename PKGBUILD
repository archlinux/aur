# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gtkmathview
pkgver=0.8.0
pkgrel=6
pkgdesc="C++ rendering engine for MathML documents"
arch=('x86_64')
url="http://helm.cs.unibo.it/mml-widget/"
license=('LGPL3')
depends=('popt' 'gtk2' 't1lib' 'gmetadom' 'pangox-compat')
source=(http://helm.cs.unibo.it/mml-widget/sources/${pkgname}-${pkgver}.tar.gz
        gtkmathview-0.8.0-gcc43.patch
        gtkmathview-0.8.0-cond-t1.patch
        gtkmathview-0.8.0-gcc47.patch
        gtkmathview-0.8.0-includes.patch
        gtkmathview-gcc6.patch
        gtkmathview-gcc7.patch)
md5sums=('b53564e553728d4b69f7d366dfeb5299'
         '92eb2870c1922cbebd5566900cde220b'
         'a79a27e00908e75712bc9453b669fe61'
         '8c8620aee002b30975e1e175ef9af7a7'
         '4fc8daefbf27d49067b0c66bba54f428'
         '280e26beb1b6f1008d75b90c485dd47f'
         '8ecffe417121723755749444dfcbbafb')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -Np1 -i ${srcdir}/gtkmathview-0.8.0-gcc43.patch
  patch -Np1 -i ${srcdir}/gtkmathview-0.8.0-gcc47.patch
  patch -Np1 -i ${srcdir}/gtkmathview-0.8.0-includes.patch
  patch -Np1 -i ${srcdir}/gtkmathview-0.8.0-cond-t1.patch
  patch -p1 -i ../gtkmathview-gcc6.patch # Debian patch  
  patch -p1 -i ../gtkmathview-gcc7.patch # Debian patch

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

