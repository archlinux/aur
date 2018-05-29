pkgname=zerotier-one-armv7h
pkgver=1.2.8
pkgrel=1
pkgdesc="Creates virtual Ethernet networks of almost unlimited size."
arch=('armv7h')
url="https://www.zerotier.com/index.html"
license=('GPL3')
depends=('gcc-libs' 'http-parser' 'libnatpmp' 'miniupnpc')
makedepends=('ruby-ronn')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zerotier/ZeroTierOne/archive/$pkgver.tar.gz")
sha512sums=('a97a8ff0e5050294fd8d56e74b5dd320b77822242ed4d43919c62a361ccbe1837417cba07d4114c91e277816f60bf47d226f37f816278bfd96505b752ef5d5ff')

prepare() {
  cd ZeroTierOne-$pkgver
  sed -i 's|"2.."|"2..*"|' make-linux.mk
  sed -i "s/\-dumpmachine \| cut \-d \'\-\' \-f 1/\-dumpmachine \| cut \-d '\-' \-f 1 | sed 's\/armv7l\/armv7\/'/" make-linux.mk
  sed -i 's/sbin/bin/' make-linux.mk debian/zerotier-one.service
}

build() {
  cd ZeroTierOne-$pkgver
  make
}

check() {
  cd ZeroTierOne-$pkgver
  make selftest
  ./zerotier-selftest
}

package() {
  cd ZeroTierOne-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 debian/zerotier-one.service "$pkgdir"/usr/lib/systemd/system/zerotier-one.service
}
