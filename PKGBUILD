# Maintainer: Dimitri Kaparis <dimitri at kaparis dot name>
# Contributor: redfish <redfish at galactica.pw>

pkgname=bitcoin-unlimited
pkgver=2.0.0.0
_pkgbase=BCHUnlimited-BCHunlimited${pkgver}
pkgrel=2
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
source=("https://gitlab.com/bitcoinunlimited/BCHUnlimited/-/archive/BCHunlimited${pkgver}/BCHUnlimited-BCHunlimited${pkgver}.tar.bz2"
	"include-cstdint.patch"
	"b1b51490058bbc693eca8ef7abd69dc022446201-cast-nHeight-to-int32_t-to-match-the-VarIntMode-expe.patch")
install=$pkgname.install

prepare() {
  cd "$srcdir/$_pkgbase"

  patch -p1 -i ../include-cstdint.patch
  patch -p1 -i ../b1b51490058bbc693eca8ef7abd69dc022446201-cast-nHeight-to-int32_t-to-match-the-VarIntMode-expe.patch
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

sha256sums=('d744af691a23a46cccace8e2f5d45e17c3c70af10851a659bb28d1ab4684d0d6'
            '33da7529884988c62924e691ead10b59a137fcf6bd88cb0802f2090f670ba9be'
            'a19f1c3011a4e1327127dc4f3ae7ff15817fa3306001f4c1aee68e95f6ad23f6')
