# Maintainer:  nanpuyue <nanpuyue@gmail.com>

pkgname=rpcapd
_srcname=libpcap
pkgver=1.9.0
pkgrel=1
pkgdesc='A remote packet capture daemon'
arch=('x86_64' 'armv7h')
url='http://www.tcpdump.org/'
license=('BSD')
source=(http://www.tcpdump.org/release/libpcap-${pkgver}.tar.gz)
sha256sums=('2edb88808e5913fdaa8e9c1fcaf272e19b2485338742b5074b9fe44d68f37019')

build() {
  cd $_srcname-$pkgver
  ./configure --prefix=/usr \
    --enable-remote
  make
}

package() {
  cd $_srcname-$pkgver
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd $pkgname
  make DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"

  install -d -m755 "$pkgdir/usr/lib/systemd/system"
  sed -i 's#local/##' rpcapd@.service
  install -Dm644 rpcapd.socket rpcapd@.service "$pkgdir/usr/lib/systemd/system"
}
