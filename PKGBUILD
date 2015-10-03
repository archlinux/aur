# Maintainer: Nicolas Doualot <packages@slubman.info>

pkgname=('dash-daemon' 'dash-cli' 'dash-qt')
pkgbase=dash
pkgver=0.12.0.55
pkgrel=2
arch=('i686' 'x86_64')
url="http://www.dashpay.io/"
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc' 'protobuf')
license=('MIT')
source=("https://github.com/dashpay/dash/archive/v$pkgver.tar.gz"
	"upnp-1.9.patch"
        "dashd@.service"
)
sha256sums=('ee36a4984656b2183659182bf107584cb7963841b47b536250da533f492c1ea8'
            '3060917f8e327002da842534265392a1849239ec5049f25c1ae8a81c3952e7b1'
            '00b656fe05c5b58115d41c20ca7dfba6564eaa5335e3ff5c43c3eb8d9479cab9')
depends=('boost-libs' 'openssl')

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  patch -p1 -i ../upnp-1.9.patch
  ./autogen.sh
  ./configure --with-incompatible-bdb --enable-hardening
  make
}

package_dash-daemon() {
  depends=('boost-libs' 'openssl' 'miniupnpc')
  pkgdesc="Dash peer-to-peer network based digital currency (daemon)"

  install -Dm644 dashd@.service "$pkgdir/usr/lib/systemd/system/dash@.service"
  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm755 src/dashd "$pkgdir"/usr/bin/dashd
  install -Dm644 contrib/debian/examples/dash.conf \
    "$pkgdir/usr/share/doc/$pkgname/examples/dash.conf"
  install -Dm644 contrib/debian/manpages/dashd.1 \
    "$pkgdir"/usr/share/man/man1/dashd.1
  install -Dm644 contrib/debian/manpages/dash.conf.5 \
    "$pkgdir"/usr/share/man/man5/dash.conf.5
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_dash-cli() {
  pkgdesc="Dash peer-to-peer network based digital currency (CLI)"

  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm755 src/dash-cli "$pkgdir"/usr/bin/dash-cli
  install -Dm755 src/dash-tx "$pkgdir"/usr/bin/dash-tx
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_dash-qt() {
  depends=('boost-libs' 'qt4' 'qrencode' 'protobuf' 'miniupnpc')
  install=dash-qt.install
  pkgdesc="Dash peer-to-peer network based digital currency (Qt)"

  cd "$srcdir/$pkgbase-$pkgver"
  install -Dm755 src/qt/dash-qt "$pkgdir"/usr/bin/dash-qt
  install -Dm644 contrib/debian/dash-qt.desktop "$pkgdir"/usr/share/applications/dash.desktop
  install -Dm644 share/pixmaps/bitcoin128.png "$pkgdir"/usr/share/pixmaps/dash128.png
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

