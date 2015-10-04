# Maintainer: Nicolas Doualot <packages@slubman.info>

pkgname=('peerunity-daemon' 'peerunity-qt')
pkgbase=peerunity
pkgver=0.1.1
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.peercoin.net/download-peerunity"
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc' 'protobuf')
license=('MIT')
source=("https://github.com/peerunity/peerunity/archive/v$pkgver.tar.gz"
	"upnp-1.9.patch"
        "peerunityd@.service"
	"peerunity.desktop"
	"peerunity128.png"
)
sha256sums=('416ad4c36551b62e2048bcd6844004444ea52b2640c8c7c88bcbd6c0829c5499'
            '3060917f8e327002da842534265392a1849239ec5049f25c1ae8a81c3952e7b1'
            'cfc0b8accef8dee3d6559cdb880e13f4ef381119f4150d15cc3f74903da80f35'
            '250aa80695bbb95228286850856d1f1bac9336c98e884cba0b148c9b837d196c'
            '2d089702a9f02db640f7ae0f48b7b61f7de6ecddc3804f80484520b6c461a9b1')
depends=('boost-libs' 'openssl' 'miniupnpc')

prepare() {
  cd "$srcdir/Peerunity-$pkgver"
  patch -p1 -i ../upnp-1.9.patch
}

build() {
  cd "$srcdir/Peerunity-$pkgver"
  qmake-qt4 "USE_UPNP=1" "USE_QRCODE=1"
  make

  cd "$srcdir/Peerunity-$pkgver/src"
  make -f makefile.unix USE_UPNP=1
}

package_peerunity-daemon() {
  depends=('boost-libs' 'openssl' 'miniupnpc')
  pkgdesc="Community client for Peercoin peer-to-peer network based digital currency (daemon)"

  install -Dm644 peerunityd@.service "$pkgdir/usr/lib/systemd/system/peerunity@.service"
  cd "$srcdir/Peerunity-$pkgver"
  install -Dm755 src/peerunityd "$pkgdir"/usr/bin/peerunityd
  install -Dm644 contrib/debian/examples/bitcoin.conf "$pkgdir/usr/share/doc/$pkgname/examples/peerunity.conf"
  install -Dm644 contrib/debian/manpages/bitcoind.1 "$pkgdir"/usr/share/man/man1/peerunityd.1
  install -Dm644 contrib/debian/manpages/bitcoin.conf.5 "$pkgdir"/usr/share/man/man5/peerunity.conf.5
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_peerunity-qt() {
  depends=('boost-libs' 'qt4' 'qrencode' 'miniupnpc')
  install=peerunity-qt.install
  pkgdesc="Comunity client for Peercoin peer-to-peer network based digital currency (Qt)"

  install -Dm644 peerunity.desktop "$pkgdir"/usr/share/applications/peerunity.desktop
  install -Dm644 peerunity128.png "$pkgdir"/usr/share/pixmaps/peerunity128.png
  cd "$srcdir/Peerunity-$pkgver"
  install -Dm755 peerunity "$pkgdir"/usr/bin/peerunity
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

