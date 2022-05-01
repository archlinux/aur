# Maintainer: willemw <willemw12@gmail.com>
# Contributor: David Schury <dasc at posteo de>

pkgname=inadyn-git
pkgver=2.9.1.r12.g5e510c5
pkgrel=1
pkgdesc="Dynamic DNS client with SSL/TLS support"
arch=('x86_64')
url="http://troglobit.com/inadyn.html"
license=('GPL')
depends=('ca-certificates' 'confuse' 'openssl')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/inadyn.conf')
source=("$pkgname::git+https://github.com/troglobit/inadyn.git")
sha256sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin --enable-openssl
  make
}

package() {
  cd $pkgname
  install -Dm600 examples/inadyn.conf -t "$pkgdir/etc"
  make DESTDIR="$pkgdir" install-strip
}

