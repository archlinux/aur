# Maintainer: Sander Danielsen <thelugal at gmail dot com>
# Contributor: CarstenF <archlinux at carstenfeuls dot de>
pkgname=aprx
pkgver=2.9.0
pkgrel=2
pkgdesc="An APRS Digipeater and/or Internet Gateway"
arch=('any')
url="http://thelifeofkenneth.com/aprx/"
license=('custom')
depends=('glibc')
backup=('etc/aprx.conf')
source=("$pkgname-$pkgver.tar.gz::http://thelifeofkenneth.com/$pkgname/release/$pkgname-$pkgver.tar.gz"
        'aprx.service')
sha256sums=('28841b15310459ba8b7d9a47b49c9d2c0105924bdf9ef32f0095c300f7dbf887'
            'ef586aa9c5f7dfc70e6631e60648764738923ccb1374732f7ae356d4789e69c5')
sha512sums=('4b7b44c9fc088f9970c89cc82cdb1fe988d1991fbb54028eafaf0bae20fefbca5d310a698c50313b6ad18c5f48d3cfd4b34716dafa6a6145676b76a9cf5b99b5'
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

