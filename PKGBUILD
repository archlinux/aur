# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xqproxy-git
pkgver=0.1.1.0.gffcf6eb
pkgrel=1
pkgdesc="XDCMP query proxy"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/xqproxy"
license=('MIT')
depends=('bash' 'libx11')
conflicts=('xqproxy')
provides=('xqproxy')
makedepends=('git')
source=("$pkgname::git://anongit.freedesktop.org/xqproxy"
	"build.patch")
md5sums=('SKIP'
         'c81a0aabcb01f6a24d44196aed092d47')

pkgver() {
  cd $pkgname
  git describe --long | sed 's|-|.|g'
}
prepare() {
  cd $pkgname
  patch -Np2 -b -z .orig -i ../build.patch
  autoreconf -fiv
}
build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}
package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm755 xqssh "$pkgdir/usr/bin/xqssh"
  install -Dm644 <(head -24 xqproxy.c) "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
