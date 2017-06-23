# Maintainer: Jeff Keyte <jeff@keyte.me>

pkgname=pascalcoin
pkgver=2.0
pkgrel=1
pkgdesc='PascalCoin Wallet and Daemon'
arch=('i686' 'x86_64')
install=pascalcoin.install
url='https://github.com/PascalCoin/PascalCoin'
license=('MIT')
depends=('qt4' 'qt4pas')
makedepends=('lazarus' 'lazarus-qt' 'fpc')
source=("git+https://github.com/PascalCoin/PascalCoin.git"
	'pascalcoinwallet.desktop'
	'pascalcoin.service'
	'pascalcoin.install')
sha256sums=('SKIP'
'547801a11497ee52220e4dc6cb6d2c43aeb6e94d989697cb0a54d26e4a4cad58'
'74713e3702cbd13a8847de340029f6c3608f1dbae536e58cfa53c5035101d060'
'5b308a22ea19b9b71b67cc5178b03bbcf1c90cc5d0abe42592e26b701649231a')

build() {
  cd "$srcdir/PascalCoin"
  lazbuild --pcp=Lazarus -B --lazarusdir=/usr/lib/lazarus --ws=qt PascalCoinWalletLazarus.lpi
  lazbuild --pcp=Lazarus -B --lazarusdir=/usr/lib/lazarus pascalcoin_daemon.lpi
}

package() {
  install -d "${pkgdir}"/opt/pascalcoin
  install -m 755 "${srcdir}"/PascalCoin/PascalCoinWalletLazarus "${pkgdir}"/opt/pascalcoin
  install -m 755 "${srcdir}"/PascalCoin/pascalcoin_daemon "${pkgdir}"/opt/pascalcoin
  install -m 644 "${srcdir}"/PascalCoin/pascalcoin_daemon.ini "${pkgdir}"/opt/pascalcoin
  install -d "${pkgdir}"/usr/share/applications
  install -m 644 "${srcdir}"/pascalcoinwallet.desktop "${pkgdir}"/usr/share/applications
  install -d "${pkgdir}"/etc/systemd/system
  install -m 644 "${srcdir}"/pascalcoin.service "${pkgdir}"/etc/systemd/system
}
