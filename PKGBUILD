# $Id: PKGBUILD 125634 2015-01-08 22:36:46Z bgyorgy $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=flumotion
pkgver=0.10.1
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc="A streaming media server"
url="http://www.flumotion.net"
license=('GPL')
backup=(etc/flumotion/workers/default.xml
	etc/flumotion/managers/default/planet.xml)
depends=('gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins' 'gstreamer0.10-python' 'kiwi'
	 'pygtk' 'python2-crypto' 'python2-pyopenssl' 'python2-twisted')
makedepends=('perl-xml-parser')
source=(http://www.flumotion.net/src/$pkgname/$pkgname-$pkgver.tar.bz2
        twisted-13.patch
        fix-import.patch)
md5sums=('fbbb2f4ccf0624742c5ca8238f3ec5e0'
         '67c870a226d14afb6d391ae6386a0fa3'
         '8f8f1859059b91ebd9e9828f2f52a701')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Compatibily fix with twisted 13
  patch -Np1 -i ../twisted-13.patch

  # Fix import with recent python2
  patch -Np1 -i ../fix-import.patch

  # python2 fix
  sed -i 's_candidate in python_candidate in python2_' configure
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/etc/$pkgname"
  make DESTDIR="$pkgdir" install
  cp -R conf/workers "$pkgdir/etc/$pkgname"
  cp -R conf/managers "$pkgdir/etc/$pkgname"
  cp conf/default.pem "$pkgdir/etc/$pkgname"
}
