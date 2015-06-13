# Contributor: Tom <tomgparchaur@gmail.com>
# Based on a quantax contribution for irssi-otr

pkgname=xchat-otr
pkgver=0.3
pkgrel=2
pkgdesc="Off-the-Record Messaging (OTR) plugin for the XChat IRC client"
arch=('i686' 'x86_64')
url="http://irssi-otr.tuxfamily.org/"
license=('GPL')
depends=('xchat' 'libotr3')
makedepends=('cmake' 'pkgconfig' 'python')
source=("ftp://download.tuxfamily.org/irssiotr/${pkgname}-${pkgver}.tar.gz"
	'http://xchat.org/docs/xchat-plugin.h')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p ${srcdir}/${pkgname}-${pkgver}/xchat
  install -m 644 ${srcdir}/xchat-plugin.h ${srcdir}/${pkgname}-${pkgver}/xchat/ || return 1
  find ${srcdir}/${pkgname}-${pkgver} -type f -print0 | xargs -0 sed -i 's@libotr/@libotr3/@g'
  cmake -DXCHAT_INCLUDE_DIR=${srcdir}/${pkgname}-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr . -DLIBOTR_LIBRARY=/usr/lib/libotr3.so
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  mv ${pkgdir}/usr/share/doc/irssi-otr ${pkgdir}/usr/share/doc/xchat-otr || return 1
  install -m 644 ${srcdir}/${pkgname}-${pkgver}/README.xchat ${pkgdir}/usr/share/doc/xchat-otr || return 1
  rm ${pkgdir}/usr/share/doc/xchat-otr/LICENSE || return 1
}

md5sums=('49706959af491c721a8a5a62bd224670'
         '5ee7da5abedc78a30b90e737370d8f0b')
