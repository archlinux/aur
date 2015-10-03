# $Id$
# Maintainer: Mark Pustjens <pustjens@dds.nl>
# Contributor:  Eric B?Šlanger <eric@archlinux.org>
# Contributor: Smith Dhumbumroong <zodmaner@gmail.com>

pkgname=alpine-fancythreading
real_pkgname=alpine
pkgver=2.20
pkgrel=1
pkgdesc="The continuation of the Alpine email client from University of Washington. Including Enhanced fancy threading, Topal and maildir patches."
arch=('i686' 'x86_64')
url="http://patches.freeiz.com/alpine/index.html"
license=('APACHE')
depends=('libldap' 'krb5')
optdepends=('aspell: spell-checking support'
	    'hunspell: spell-checking support')
provides=('pine' 'alpine')
conflicts=('pine' 'alpine' 're-alpine')
replaces=('pine' 'alpine')
options=('!makeflags')
source=(http://patches.freeiz.com/alpine/release/src/alpine-${pkgver}.tar.xz
        http://patches.freeiz.com/alpine/patches/alpine-2.20/maildir.patch.gz
	http://patches.freeiz.com/alpine/patches/alpine-2.20/fancy.patch.gz)
sha1sums=('05f4908a347969b77b684cc8b995d4aaa1506155'
          '7ae3d7faa19c33a773e3820cf7bcae99ac69a5c4'
          '31f14b276425681d714fda215cc8fb63612996c3')

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
