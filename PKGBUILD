# $Id$

pkgname=dvdisaster-secretsauce
_pkgname=dvdisaster
pkgver=0.72.6
pkgrel=1
pkgdesc="Provides a margin of safety against data loss on CD and DVD media caused by aging or scratches"
arch=('i686' 'x86_64')
url="http://www.dvdisaster.com/"
license=('GPL')
depends=('gtk2')
conflicts=(${_pkgname})
provides=(${_pkgname})
options=('!makeflags')
install=dvdisaster.install
source=(http://dvdisaster.net/downloads/${_pkgname}-${pkgver}.tar.bz2 secretsauce.patch)
sha1sums=('eae45e40c2923c7d5c5a01f16470258aa45734ff'
          '98ef85d933906ab26364351448033be2c72701ca')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -i 's/dvdisaster48/dvdisaster/' contrib/dvdisaster.desktop
  # generated with: diff -Naur dvdisaster-0.72.6 dvdisaster-0.72.6.new > secretsauce.patch
  patch -p1 < ../secretsauce.patch
}

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr \
    --mandir=/usr/share/man --docdir=/usr/share/doc \
    --localedir=/usr/share/locale \
    --with-nls=yes 
  make
}

package() {
  cd ${_pkgname}-${pkgver}

  make BUILDROOT="${pkgdir}" install
  rm -f "${pkgdir}/usr/bin/dvdisaster-uninstall.sh"
  install -D -m 644 contrib/dvdisaster.desktop "${pkgdir}/usr/share/applications/dvdisaster.desktop"
  for i in 16 24 32 48 64 ; do
    install -D -m 644 contrib/dvdisaster${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/dvdisaster.png"
  done
}
