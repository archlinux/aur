# $Id$
# Maintainer: Mark Pustjens <pustjens@dds.nl>
# Contributor:  Eric B?Šlanger <eric@archlinux.org>
# Contributor: Smith Dhumbumroong <zodmaner@gmail.com>

pkgname=alpine-fancythreading
real_pkgname=alpine
pkgver=2.21
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
source=(http://patches.freeiz.com/alpine/release/src/alpine-${pkgver}.tar.xz
        http://patches.freeiz.com/alpine/patches/alpine-2.21/maildir.patch.gz
	http://patches.freeiz.com/alpine/patches/alpine-2.21/fancy.patch.gz)
sha512sums=('af31c4d5df292f30d1de61d3dc7141ca1dea12df65a5ca4e9955cc20c795794f154f3bbe3ff491c6d1eedae5c98c35133b3caf648f92af40151219d48bcc21e5'
            'af31c4d5df292f30d1de61d3dc7141ca1dea12df65a5ca4e9955cc20c795794f154f3bbe3ff491c6d1eedae5c98c35133b3caf648f92af40151219d48bcc21e5'
            'af31c4d5df292f30d1de61d3dc7141ca1dea12df65a5ca4e9955cc20c795794f154f3bbe3ff491c6d1eedae5c98c35133b3caf648f92af40151219d48bcc21e5')

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
