# Contributor: Manuel Serrano <Manuel.Serrano@inria.fr>
# Contributor: MCMic <come.bernigaud@laposte.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=hop
pkgver=3.0.0_rc9
_pkgver=${pkgver//_/-}
pkgrel=3
pkgdesc="Software Development Kit for the Web"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('bigloo')
install=hop.install
url='http://hop.inria.fr'
source=("ftp://ftp-sop.inria.fr/indes/fp/Hop/$pkgname-${_pkgver}.tar.gz" hop)
md5sums=('530ee3a07e8c79b001821eb3c0565f3a'
         'c01ff06ad4faca90e6da4a2ee9b8e533')
options=('!makeflags')

build() {
  cd ${srcdir}/$pkgname-$_pkgver
  ./configure --prefix=/usr --etcdir=/etc/hop --mandir=/usr/share/man
  make
  make doc
}

check() {
  cd ${srcdir}/$pkgname-$_pkgver
  make test
}
  
package() {
  cd ${srcdir}/$pkgname-$_pkgver
  make DESTDIR=${pkgdir} install

  install -Dm644 arch/archlinux/conf.d/hop.in $pkgdir/etc/conf.d/hop
  install -Dm755 arch/archlinux/rc.d/hop.in $pkgdir/etc/rc.d/hop
  install -Dm644 arch/archlinux/systemd/hop.service.in \
	  $pkgdir/usr/lib/systemd/system/hop.service
  install -Dm644 arch/archlinux/systemd/hop.socket.in \
	  $pkgdir/usr/lib/systemd/system/hop.socket
  cd ${pkgdir}/usr/bin; rm hop; ln -s hop-$pkgver hop
}
