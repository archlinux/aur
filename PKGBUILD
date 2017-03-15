# Maintainer: Sander Danielsen <thelugal at gmail dot com>
# Contributor: CarstenF <archlinux at carstenfeuls dot de>
pkgname=aprx
pkgver=2.9.0
pkgrel=1
pkgdesc="An APRS Digipeater and/or Internet Gateway"
arch=('any')
url="http://thelifeofkenneth.com/aprx/"
license=('custom')
depends=('glibc')
backup=('etc/aprx.conf')
source=("http://thelifeofkenneth.com/$pkgname/release/$pkgname-$pkgver.tar.gz"
        'aprx.service')
sha256sums=('28841b15310459ba8b7d9a47b49c9d2c0105924bdf9ef32f0095c300f7dbf887'
            'ef586aa9c5f7dfc70e6631e60648764738923ccb1374732f7ae356d4789e69c5')

build() {
# For a small memory system without writeable /tmp add --with-embedded   
   cd "$pkgname-$pkgver"
  ./configure --prefix=/usr -mandir=/usr/share/man #--with-embedded 
  make
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

