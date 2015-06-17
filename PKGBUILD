# Maintainer: M0Rf30

pkgbase=ziftrcoin
pkgname=('ziftrcoin-daemon' 'ziftrcoin-cli' 'ziftrcoin-qt')
pkgver=0.9.31
pkgrel=1
arch=('i686' 'x86_64')
url="https://www.ziftrcoin.com/"
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc' 'protobuf')
license=('MIT')
source=(https://github.com/ZiftrCOIN/ziftrcoin/archive/v$pkgver.tar.gz)

# Upstream should be more coherent!
case "$pkgver" in
*.*.*.*)
  _pkgver=${pkgver%.*}
  ;;
*)
  _pkgver=$pkgver
  ;;
esac

build() {
  cd "$srcdir/$pkgbase-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --with-incompatible-bdb --with-gui=qt4
  make  CXXFLAGS="$CXXFLAGS  -fPIC"
}

package_ziftrcoin-qt() {
  pkgdesc="Ziftrcoin is an experimental new digital couponing system - Qt"
  depends=(boost-libs qt4 miniupnpc qrencode protobuf)
  install=ziftrcoin-qt.install

  cd "$pkgbase-$pkgver"
  install -Dm755 src/qt/ziftrcoin-qt "$pkgdir"/usr/bin/ziftrcoin-qt
  install -Dm644 contrib/debian/ziftrcoin-qt.desktop \
    "$pkgdir"/usr/share/applications/ziftrcoin.desktop
  install -Dm644 share/pixmaps/ziftrcoin128.png \
    "$pkgdir"/usr/share/pixmaps/ziftrcoin128.png

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_ziftrcoin-daemon() {
  pkgdesc="Ziftrcoin is an experimental new digital couponing system - daemon"
  depends=(boost-libs miniupnpc openssl)

  cd "$pkgbase-$pkgver"
  install -Dm755 src/ziftrcoind "$pkgdir"/usr/bin/ziftrcoind
  install -Dm644 contrib/debian/examples/ziftrcoin.conf \
    "$pkgdir/usr/share/doc/$pkgname/examples/ziftrcoin.conf"
  install -Dm644 contrib/debian/manpages/ziftrcoind.1 \
    "$pkgdir"/usr/share/man/man1/ziftrcoind.1
  install -Dm644 contrib/debian/manpages/ziftrcoin.conf.5 \
    "$pkgdir"/usr/share/man/man5/ziftrcoin.conf.5
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_ziftrcoin-cli() {
  pkgdesc="Ziftrcoin is an experimental new digital couponing system - RPC client"
  depends=(boost-libs openssl)

  cd "$pkgbase-$pkgver"
  install -Dm755 src/ziftrcoin-cli "$pkgdir"/usr/bin/ziftrcoin-cli
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

md5sums=('eb35bd7a8c7962b80dc957578f847a95')
