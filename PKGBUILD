# Contributor: Manuel Serrano <Manuel.Serrano@inria.fr>
# Contributor: MCMic <come.bernigaud@laposte.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=hop-git
epoch=2
pkgver=3.2.0.r5367
pkgrel=3
pkgdesc="Software Development Kit for the Web"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('bigloo' 'gmp' 'libunistring' 'libuv' 'avahi' 'sqlite')
makedepends=('git')
conflicts=('hop')
provides=('hop')
install=hop.install
url='http://hop.inria.fr'
source=("git+https://github.com/manuel-serrano/hop.git#branch=3.2.x")
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd ${pkgname%-git}
  . .hoprelease
  printf "%s.r%s" $major "$(git rev-list --count HEAD)" 
}

build() {
  cd ${pkgname%-git}
  ./configure --prefix=/usr --etcdir=/etc/hop --mandir=/usr/share/man \
	      --disable-ssl --bigloobindir=/usr/bin \
	      --bigloolibdir=/usr/lib/bigloo/4.3f
  sed -i 's/, -static-all-bigloo//' share/Makefile
  LD_LIBRARY_PATH="$PWD/lib/hop/3.2.0/" make
  make doc
}

check() {
  cd ${pkgname%-git}
  make test
}
  
package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install
  install -Dm644 arch/archlinux/conf.d/hop.in "$pkgdir"/etc/conf.d/hop
  install -Dm755 arch/archlinux/rc.d/hop.in "$pkgdir"/etc/rc.d/hop
  install -Dm644 arch/archlinux/systemd/hop.service.in \
	  "$pkgdir"/usr/lib/systemd/system/hop.service
  install -Dm644 arch/archlinux/systemd/hop.socket.in \
	  "$pkgdir"/usr/lib/systemd/system/hop.socket

  install -Dm755 arch/archlinux/bin/hop.sh "$pkgdir"/usr/bin/hop.sh
  cd "$pkgdir"/usr/bin; rm hop; ln -s hop-3.2.0 hop
}
