pkgname=zerotier-one-armv7h
pkgver=1.2.4
pkgrel=1
pkgdesc="Creates virtual Ethernet networks of almost unlimited size."
arch=('armv7h')
url="https://www.zerotier.com/index.html"
license=('GPL3')
depends=('gcc-libs' 'http-parser' 'libnatpmp' 'miniupnpc')
makedepends=('ruby-ronn')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zerotier/ZeroTierOne/archive/$pkgver.tar.gz")
sha512sums=('82adb110208d24ae2745e3839810afcac87955de050ebfe0517a7dc2a875881dafd40c1b16a041742d8c4d0f6513abcc71d6ea3e06c2fb89b47be2630a500363')

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
