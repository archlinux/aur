# $Id: PKGBUILD 78820 2012-10-25 06:47:28Z foutrelis $
# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Essien Ita Essien <me@essienitaessien.com>
# Contributor: Brice Mealier <mealier_brice@yahoo.fr>

pkgname=omniorb
pkgver=4.2.0
pkgrel=1
pkgdesc="A CORBA object request broker for C++ and Python."
arch=('i686' 'x86_64')
url="http://omniorb.sourceforge.net/"
license=('GPL2' 'LGPL2')
depends=('python2' 'openssl')
makedepends=('pkgconfig')
source=(http://downloads.sourceforge.net/omniorb/omniORB-${pkgver}.tar.bz2)
md5sums=('f1e104d0a2df92829c1b37a853f4805d')
sha256sums=('74c273fc997c2881b128feb52182dbe067acfecc4cf37475f43c104338eba8bc')
sha384sums=('adee704d374be5ca9ccedfd3fc53b4fff4b790931fd77680436f89e1920b628fbc1b47be78c2cf7961d0107c5689ca25')
sha512sums=('9a9b42fc94085e6d0a37d0ba6c81ca4657524122863fc246972e1e615ab5322c2122f211ff5c8e4c5540536b65af66a4bf7f76fd4643fab6b3578dc9ff26324c')

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
