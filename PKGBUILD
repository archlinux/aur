# Maintainer: Dimitri Kaparis <dimitri at kaparis dot name>
# Contributor: redfish <redfish at galactica.pw>

pkgname=bitcoin-unlimited
pkgver=1.9.0.0
_pkgbase=BitcoinUnlimited-BCHunlimited${pkgver}
pkgrel=1
pkgdesc='Bitcoin Unlimited Cash (BCH) versions of Bitcoind, bitcoin-cli, 
bitcoin-tx, and bitcoin-qt, w/GUI and wallet'
arch=('i686' 'x86_64' 'armv7h')
url="http://www.bitcoinunlimited.info"
license=('MIT')
depends=('boost-libs' 'desktop-file-utils' 'libevent' 'openssl')
optdepends=('miniupnpc' 'db4.8' 'qt5-base' 'protobuf' 'qrencode')
makedepends=('boost' 'qt5-tools')
provides=('bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
conflicts=('bitcoin-unlimited-git' 'bitcoin-daemon' 'bitcoin-cli' 'bitcoin-qt' 'bitcoin-tx')
source=("https://github.com/BitcoinUnlimited/BitcoinUnlimited/archive/BCHunlimited${pkgver}.tar.gz"
	include-stack.patch
	QtPainterPath.patch)
install=$pkgname.install

prepare() {
  cd "$srcdir/$_pkgbase"
  # fix compilation error
  patch -p1 < ../include-stack.patch
  # PR 2251
  patch -p1 < ../QtPainterPath.patch
}

build() {
  cd "$srcdir/$_pkgbase"

  ./autogen.sh
  ./configure --prefix=/usr --with-incompatible-bdb
  make
}

package() {
  cd "$srcdir/$_pkgbase"
  
  make install DESTDIR=$pkgdir
  install -Dm644 "contrib/debian/bitcoin-qt.desktop" \
                 "$pkgdir/usr/share/applications/bitcoin.desktop"
  install -Dm644 "share/pixmaps/bitcoin128.png"\
                 "$pkgdir/usr/share/pixmaps/bitcoin128.png"
  install -Dm644 "contrib/debian/manpages/bitcoin-qt.1" \
                 "$pkgdir/usr/share/man/man1/bitcoin-qt.1"
  install -Dm644 "contrib/debian/examples/bitcoin.conf"\
                 "$pkgdir/usr/share/doc/$pkgname/examples/bitcoin.conf"
  install -Dm644 "contrib/debian/manpages/bitcoind.1"\
                 "$pkgdir/usr/share/man/man1/bitcoind.1"
  install -Dm644 "contrib/debian/manpages/bitcoin.conf.5"\
                 "$pkgdir/usr/share/man/man5/bitcoin.conf.5"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

sha256sums=('e05a13abf5554479ea6e02f9355d9a636bd3c73e50db4db99ced35ea9550af9a'
            '21b21e4f9c541d8412b5125e3d53e943b4794b5247f34f50bb84eaa1757cf9e0'
            '4f0a85b972a3b6a986b4c9a17da7b1fdf7c7c22f38588057c191d90db84ed3a8')
