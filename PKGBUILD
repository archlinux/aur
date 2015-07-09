# Maintainer: Loïc Guitaut <flink at belfalas dot eu>
# Contributor: Lukas Sabota <lukas at lwsabota dot com>

pkgname='litecoin-daemon'
pkgver=0.10.2.2
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.litecoin.org/"
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc')
license=('MIT')
source=("https://github.com/litecoin-project/litecoin/archive/v$pkgver.tar.gz"
        "litecoind@.service"
)
sha256sums=('952c84b181323db17a8fa23217f59b576ad3ebad92c158b3a7c29d458a1130dc'
            '3e0afef47970cdf304a376b51dbbb44759ac7eeb232be1ea4b2b995817b5df88')
pkgdesc="Peer-to-peer network based digital currency (daemon)"
depends=(boost-libs miniupnpc openssl)
conflicts=(litecoin)

build() {
  cd "$srcdir/litecoin-$pkgver"
  ./autogen.sh
  ./configure --without-gui --with-incompatible-bdb
  make
}

package() {
  install -Dm644 litecoind@.service "$pkgdir/usr/lib/systemd/system/litecoind@.service"
  cd "$srcdir/litecoin-$pkgver"
  install -Dm755 src/litecoind "$pkgdir"/usr/bin/litecoind
  install -Dm644 contrib/debian/examples/bitcoin.conf \
    "$pkgdir/usr/share/doc/$pkgname/examples/litecoin.conf"
  install -Dm644 contrib/debian/manpages/bitcoind.1 \
    "$pkgdir"/usr/share/man/man1/litecoind.1
  install -Dm644 contrib/debian/manpages/bitcoin.conf.5 \
    "$pkgdir"/usr/share/man/man5/litecoin.conf.5
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

