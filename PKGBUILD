# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=startup-notification-git
_pkgname=startup-notification
pkgver=0.12.r14.gb610115
pkgrel=1
pkgdesc="Monitor and display application startup"
arch=(i686 x86_64)
license=('LGPL')
depends=('libx11' 'xcb-util')
makedepends=('git')
provides=($_pkgname=0.12)
conflicts=($_pkgname)
url="https://www.freedesktop.org"
source=(${pkgname}::git+https://anongit.freedesktop.org/git/startup-notification.git)
source=(${pkgname}::git+https://github.com/bbidulock/startup-notification.git)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/[-_]/./g'
}

prepare() {
  cd ${pkgname}
  autoreconf -fiv
}

build() {
  cd ${pkgname}
  ./configure --prefix=/usr --localstatedir=/var --sysconfdir=/etc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
}
