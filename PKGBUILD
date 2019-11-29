# Maintainer:  nanpuyue <nanpuyue@gmail.com>

pkgname=rpcapd
_srcname=libpcap
pkgver=1.9.1
pkgrel=1
pkgdesc='A remote packet capture daemon'
arch=('x86_64' 'armv7h')
url='http://www.tcpdump.org/'
license=('BSD')
makedepends=('bison')
source=("http://www.tcpdump.org/release/libpcap-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('1F166A5742ABB9E0249A8D30E089DEF1D9C15D0D')
sha256sums=('635237637c5b619bcceba91900666b64d56ecb7be63f298f601ec786ce087094'
            'SKIP')

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
