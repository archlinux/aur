# Contributor: Manuel Serrano <Manuel.Serrano@inria.fr>
# Contributor: MCMic <come.bernigaud@laposte.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=hop
pkgver=3.1.0_pre2
_pkgver=${pkgver//_/-}
pkgrel=9
pkgdesc="Software Development Kit for the Web"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('bigloo-devel>=30:4.3alpha11Oct17')
install=hop.install
url='http://hop.inria.fr'
source=("ftp://ftp-sop.inria.fr/indes/fp/Hop/$pkgname-${_pkgver}.tar.gz" hop)
sha256sums=('21a01ab8ae9529d856b31db49151175dc7c4cbea6c881479f3fc5dd6773a782f'
            'd1b40876e3a3d06c32f17c2a50dc950ab8c6ec68d7eea0754fe284ca4c226e5b')
options=('!makeflags')

build() {
  cd $pkgname-$_pkgver
  ./configure --prefix=/usr --etcdir=/etc/hop --mandir=/usr/share/man \
	      --disable-ssl --bigloobindir=/usr/bin \
	      --bigloolibdir=/usr/lib/bigloo/4.3b 
  make
  make doc
}

check() {
  cd $pkgname-$_pkgver
  make test
}
  
package() {
  cd $pkgname-$_pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 arch/archlinux/conf.d/hop.in "$pkgdir"/etc/conf.d/hop
  install -Dm644 arch/archlinux/systemd/hop.service.in \
	  "$pkgdir"/usr/lib/systemd/system/hop.service
  install -Dm644 arch/archlinux/systemd/hop.socket.in \
	  "$pkgdir"/usr/lib/systemd/system/hop.socket
  cd "$pkgdir"/usr/bin; rm hop; ln -s hop-$pkgver hop
}
