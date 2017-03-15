# Maintainer: Jeff Keyte <jeff@keyte.me>

pkgname=pascalcoin
pkgver=1.5.4
pkgrel=1
pkgdesc='PascalCoin Wallet and Daemon'
arch=('i686' 'x86_64')
url='https://github.com/PascalCoin/PascalCoin'
license=('MIT')
depends=('qt4' 'qt4pas')
makedepends=('lazarus' 'lazarus-qt' 'fpc')
source=("git+https://github.com/PascalCoin/PascalCoin.git"
        "https://www.openssl.org/source/openssl-1.1.0e.tar.gz"
	'pascalcoinwallet.desktop')
sha256sums=('SKIP'
'57be8618979d80c910728cfc99369bf97b2a1abd8f366ab6ebdee8975ad3874c'
'547801a11497ee52220e4dc6cb6d2c43aeb6e94d989697cb0a54d26e4a4cad58')

pkgver() {
cd "$srcdir/PascalCoin"
git describe --tags
}

build() {
  cd "$srcdir/openssl-1.1.0e"
  ./config
  make -j$(nproc)
  cd "$srcdir/PascalCoin"
  lazbuild --pcp=Lazarus -B --lazarusdir=/usr/lib/lazarus --ws=qt PascalCoinWalletLazarus.lpi
  lazbuild --pcp=Lazarus -B --lazarusdir=/usr/lib/lazarus pascalcoin_daemon.lpi
}

package() {
  install -d "${pkgdir}"/opt/pascalcoin
  install -m 755 "${srcdir}"/PascalCoin/PascalCoinWalletLazarus "${pkgdir}"/opt/pascalcoin
  install -m 755 "${srcdir}"/PascalCoin/pascalcoin_daemon "${pkgdir}"/opt/pascalcoin
  install -m 755 "${srcdir}"/openssl-1.1.0e/libcrypto.so.1.1 "${pkgdir}"/opt/pascalcoin
  install -m 644 "${srcdir}"/PascalCoin/pascalcoin_daemon.ini "${pkgdir}"/opt/pascalcoin
  install -d "${pkgdir}"/usr/share/applications
  install -m 644 "${srcdir}"/pascalcoinwallet.desktop "${pkgdir}"/usr/share/applications
}
