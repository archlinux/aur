# Maintainer:  nanpuyue <nanpuyue@gmail.com>

pkgname=rpcapd
_srcname=libpcap
pkgver=1.10.2
pkgrel=1
pkgdesc='A remote packet capture daemon'
arch=('x86_64' 'aarch64' 'armv7h')
url='http://www.tcpdump.org/'
license=('BSD')
makedepends=('bison')
source=("http://www.tcpdump.org/release/libpcap-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('1F166A5742ABB9E0249A8D30E089DEF1D9C15D0D')
sha256sums=('db6d79d4ad03b8b15fb16c42447d093ad3520c0ec0ae3d331104dcfb1ce77560'
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
