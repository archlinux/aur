# Maintainer: willemw <willemw12@gmail.com>
# Contributor: David Schury <dasc at posteo de>

_pkgname=inadyn-fork
pkgname=$_pkgname-git
pkgver=2.1.r64.gfc1d555
pkgrel=1
pkgdesc="Dynamic DNS client with SSL/TLS support"
arch=('i686' 'x86_64')
url="http://troglobit.com/inadyn.html"
license=('GPL')
depends=('ca-certificates' 'confuse' 'openssl')
makedepends=('git')
provides=('inadyn')
conflicts=('inadyn')
backup=('etc/inadyn.conf')
source=($pkgname::git+https://github.com/troglobit/inadyn.git
        inadyn.conf)
sha256sums=('SKIP'
            '4967d5fad250f38167b78c53862674afec7851f7c7bb648d00afe34db062bc60')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  ./autogen.sh
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --enable-openssl
  make
}

package() {
  install -Dm600 inadyn.conf "$pkgdir/etc/inadyn.conf"

  cd $pkgname
  install -Dm644 examples/dyndns.conf "$pkgdir/usr/share/inadyn/examples/dyndns.conf"
  install -Dm644 examples/freedns.conf "$pkgdir/usr/share/inadyn/examples/freedns.conf"
  install -Dm644 examples/custom.conf "$pkgdir/usr/share/inadyn/examples/custom.conf"
  make DESTDIR="$pkgdir" install
}

