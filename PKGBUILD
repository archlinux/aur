# Contributor: Manuel Serrano <Manuel.Serrano@inria.fr>
# Contributor: MCMic <come.bernigaud@laposte.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=hop
pkgver=3.2.0_pre1
_pkgver=${pkgver//_/-}
pkgrel=8
pkgdesc="Software Development Kit for the Web"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('bigloo')
install=hop.install
url='http://hop.inria.fr'
source=("ftp://ftp-sop.inria.fr/indes/fp/Hop/$pkgname-${_pkgver}.tar.gz" hop)
sha256sums=('7058bf6786b70322d38b058b4cd234d710add0d70c5d9cac472450af823fc024'
            'd1b40876e3a3d06c32f17c2a50dc950ab8c6ec68d7eea0754fe284ca4c226e5b')
options=('!makeflags')

build() {
  cd $pkgname-$_pkgver
  ./configure --prefix=/usr --etcdir=/etc/hop --mandir=/usr/share/man \
	      --disable-ssl --bigloobindir=/usr/bin \
	      --bigloolibdir=/usr/lib/bigloo/4.3c
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
