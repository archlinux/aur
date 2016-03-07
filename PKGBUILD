# $Id$
# Maintainer: Grey Christoforo <my first name [at] my last name [dot] net>

pkgname=dvdisaster-alpha
_pkgname=dvdisaster
pkgver=0.79.5
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
source=(http://dvdisaster.net/downloads/${_pkgname}-${pkgver}.tar.bz2)
sha1sums=('23ccf697031280adb5bc3e17a0d5def0421fc28d')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -i 's/dvdisaster48/dvdisaster/' contrib/dvdisaster.desktop
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
