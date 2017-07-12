# Contributor: Manuel Serrano <Manuel.Serrano@inria.fr>
# Contributor: MCMic <come.bernigaud@laposte.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=hop
pkgver=3.1.0_pre2
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc="Software Development Kit for the Web"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('bigloo')
install=hop.install
url='http://hop.inria.fr'
source=("ftp://ftp-sop.inria.fr/indes/fp/Hop/$pkgname-${_pkgver}.tar.gz" hop)
sha256sums=('22aa60b558e6c5da6879c6eff2e153d6a520562a39444eefd26325fbceeff1fa'
            'd1b40876e3a3d06c32f17c2a50dc950ab8c6ec68d7eea0754fe284ca4c226e5b')
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
  install -Dm644 arch/archlinux/systemd/hop.service.in \
	  $pkgdir/usr/lib/systemd/system/hop.service
  install -Dm644 arch/archlinux/systemd/hop.socket.in \
	  $pkgdir/usr/lib/systemd/system/hop.socket
  cd ${pkgdir}/usr/bin; rm hop; ln -s hop-$pkgver hop
}
