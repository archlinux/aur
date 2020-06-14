# $Id$
# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Mark Pustjens <pustjens@dds.nl>
# Contributor: Eric B?Šlanger <eric@archlinux.org>
# Contributor: Smith Dhumbumroong <zodmaner@gmail.com>

pkgname=alpine-fancythreading
real_pkgname=alpine
pkgver=2.22
pkgrel=1
pkgdesc="The continuation of the Alpine email client from University of Washington. Including Enhanced fancy threading, Topal and maildir patches."
arch=('i686' 'x86_64')
url="http://alpine.x10host.com/alpine/"
license=('APACHE')
depends=('libldap' 'krb5')
optdepends=('aspell: spell-checking support'
	    'hunspell: spell-checking support')
provides=('pine' 'alpine')
conflicts=('pine' 'alpine' 're-alpine')
replaces=('pine' 'alpine')
options=('!makeflags')
source=(http://alpine.x10host.com/alpine/release/src/alpine-${pkgver}.tar.xz
        http://alpine.x10host.com/alpine/patches/alpine-2.22/maildir.patch.gz
	http://alpine.x10host.com/alpine/patches/alpine-2.22/fancy.patch.gz)
sha512sums=('7737dce02ac94170948df7fccb61380c6cb101190e37f5b3ba281d573f54df1db24569d177b460f49bfff381a922be2e4b0f3a0f1a213d88a64d361aedc3c4f1'
            'edb242ebc8ea0715479a38ad1685af8d8708d954d2e4d889f035441868cf8c738f2776b114f746a9873ddcf8e76433749ad0b70721273e995219343da5750084'
            'f0deb28bf5871fec00309d1227695107a76b192c3d4152b069ffc707f5e9e667eb00719c3b09e194bf3214d402c0d2d96d2268650e6fcc6d625ac7717bd3ebca')

build() {
  cd "${srcdir}/${real_pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/fancy.patch"
  patch -p1 -i "${srcdir}/maildir.patch"
   LIBS+="-lpam -lkrb5 -lcrypto" ./configure --prefix=/usr --with-passfile=.pine-passfile --without-tcl \
    --disable-shared --with-system-pinerc=/etc/alpine.d/pine.conf \
    --with-system-fixed-pinerc=/etc/alpine.d/pine.conf.fixed
  make
}

package() {
  cd "${srcdir}/${real_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
