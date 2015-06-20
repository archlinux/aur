# $Id$

pkgname=dvdisaster-alpha
_pkgname=dvdisaster
pkgver=0.79.3
pkgrel=2
pkgdesc="Provides a margin of safety against data loss on CD and DVD media caused by aging or scratches"
arch=('i686' 'x86_64')
url="http://www.dvdisaster.com/"
license=('GPL')
depends=('gtk2')
conflicts=(${_pkgname})
provides=(${_pkgname})
options=('!makeflags')
install=dvdisaster.install
source=(http://dvdisaster.net/downloads/${_pkgname}-${pkgver}.tar.bz2 buildFix.patch)
sha1sums=('cfa5c16d75036081b2856f1e84d04ca0f35c2656'
          'a1028bbe87e7f54a4f24c2a686cdf45890f9069d')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -i 's/dvdisaster48/dvdisaster/' contrib/dvdisaster.desktop
  # generated with: diff -Naur dvdisaster-0.79.3 dvdisaster-0.79.3.new > buildFix.patch
  patch -p1 < ../buildFix.patch
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
