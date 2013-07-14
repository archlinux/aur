# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Essien Ita Essien <me@essienitaessien.com>
# Contributor: Brice Mealier <mealier_brice@yahoo.fr>

pkgname=omniorb
pkgver=4.1.7
pkgrel=1
pkgdesc="A CORBA object request broker for C++ and Python."
arch=('i686' 'x86_64')
url="http://omniorb.sourceforge.net/"
license=('GPL2' 'LGPL2')
depends=('python2' 'openssl')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/omniorb/omniORB-${pkgver}.tar.bz2)
md5sums=('ce8cbe25418a76a2aac5395399463362')
sha256sums=('2c589ae4e1d814c81f994f1c3da10afb09e3173213b870e9056162b7331e273c')
sha384sums=('4b37e3fcd7c9fba33076d9da010eb08d516b1999de0200de0df2ad4134b919b804248e536b12d9b2a191f0cd568f7936')
sha512sums=('9bfad88232e1985056c444b92963bd3b7dab1018e355c2d8ace61eded062c51ae3d1aecabaecb0441e287cd5c79d1010bbdf8f194e61f6a3f05f9acae53bc3ae')

build() {
  cd "${srcdir}/omniORB-${pkgver}"

  # python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' "$file"
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' "$file"
  done

  PYTHON=/usr/bin/python2.7 ./configure \
         --prefix=/usr \
         --with-omniORB-config=/etc/omniorb/omniORB.cfg \
         --with-omniNames-logdir=/var/log/omniORB \
         --with-openssl=/usr

  make
}

package() {
  cd "${srcdir}/omniORB-${pkgver}"

  make DESTDIR="${pkgdir}" install

  for i in man/man1/*.1; do
    install -D -m 644 $i "${pkgdir}/usr/share/${i}"
  done
  chmod 755 "${pkgdir}"/{usr,usr/bin,usr/lib,usr/share,usr/include,usr/share/idl,usr/lib/pkgconfig,usr/lib/python2.7,usr/lib/python2.7/site-packages}
}
