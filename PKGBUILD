# Maintainer: Sander Danielsen <thelugal at gmail dot com>
# Contributor: CarstenF <archlinux at carstenfeuls dot de>
pkgname=aprx
pkgver=2.9.1
pkgrel=1
pkgdesc="An APRS Digipeater and/or Internet Gateway"
arch=('any')
url="http://thelifeofkenneth.com/aprx/"
license=('custom')
depends=('glibc')
backup=('etc/aprx.conf')
source=("$pkgname-$pkgver.tar.gz::http://thelifeofkenneth.com/$pkgname/release/$pkgname-$pkgver.tar.gz"
        'aprx.service')
sha256sums=('a28bafbb882f36e154eed19c8ed44a13dd1aac34432d2497e61479af369b61ed'
            'ef586aa9c5f7dfc70e6631e60648764738923ccb1374732f7ae356d4789e69c5')
sha512sums=('469e007e06af9979ec1423c089ef7a9d3ec6c88202d298fd616abd3b18c62d43e43b585cb7dfd5bc056b727eb98d37187de97a9e0066e09e5370fa4dfd88b6da'
            'e9a6d4ce894c692e2a959ae5a7644b1a18c7d2df550d44a3cba3bff484400262bc9da5f12b06b406ccc64094b242d6783a887eacd633a59b68d8519a299e0b6b')

build() {
# For a small memory system without writeable /tmp add --with-embedded
   cd "$pkgname-$pkgver"
  ./configure --prefix=/usr -mandir=/usr/share/man #--with-embedded
  make CFLAGS="-fcommon -O2"
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make DESTDIR="$pkgdir/" install
  cp ${srcdir}/aprx.service ${pkgdir}/usr/lib/systemd/system
  mkdir -p "${pkgdir}/usr/bin"
  mv ${pkgdir}/sbin/* ${pkgdir}/usr/bin
  rmdir ${pkgdir}/sbin
}

