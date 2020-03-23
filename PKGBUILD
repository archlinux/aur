# Contributor: Manuel Serrano <Manuel.Serrano@inria.fr>
# Contributor: MCMic <come.bernigaud@laposte.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=hop
epoch=1
pkgver=3.1.0
pkgrel=5
pkgdesc="Software Development Kit for the Web"
arch=('x86_64')
license=('GPL' 'LGPL')
depends=('bigloo' 'gmp' 'libunistring' 'libuv' 'avahi' 'sqlite')
makedepends=('git')
conflicts=('hop')
provides=('hop')
install=hop.install
url='http://hop.inria.fr'
source=("git+https://github.com/manuel-serrano/hop.git#commit=218f48c7d71b892dc143cee9e9b2071cae3bc93a")
md5sums=('SKIP')
options=('!makeflags')

build() {
  cd $pkgname
  ./configure --prefix=/usr --etcdir=/etc/hop --mandir=/usr/share/man \
	      --disable-ssl --bigloobindir=/usr/bin --link=dynamic \
	      --bigloolibdir=/usr/lib/bigloo/4.3f
  sed -i 's/, -static-all-bigloo//' share/Makefile
  LD_LIBRARY_PATH="$PWD/lib/hop/3.1.0/" make
}

check() {
  cd $pkgname
  make test
}
  
package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 arch/archlinux/conf.d/hop.in "$pkgdir"/etc/conf.d/hop
  install -Dm755 arch/archlinux/rc.d/hop.in "$pkgdir"/etc/rc.d/hop
  install -Dm644 arch/archlinux/systemd/hop.service.in \
	  "$pkgdir"/usr/lib/systemd/system/hop.service
  install -Dm644 arch/archlinux/systemd/hop.socket.in \
	  "$pkgdir"/usr/lib/systemd/system/hop.socket

  install -Dm755 arch/archlinux/bin/hop.sh "$pkgdir"/usr/bin/hop.sh
  cd "$pkgdir"/usr/bin; rm hop; ln -s hop-3.1.0 hop
}
