# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Based on https://aur.archlinux.org/packages/ledger-udev by Josh Ellithorpe

pkgname=bitbox-udev
pkgver=1
pkgrel=1
pkgdesc='Udev rules to connect bitbox01 and bitbox02 hardware wallets to your linux box'
arch=(any)
url='https://shiftcrypto.ch/'
license=(Apache)
depends=(udev)
install='bitbox-udev.install'

source=(https://raw.githubusercontent.com/digitalbitbox/bitbox-wallet-app/d045d25ac1a3839bcb7993d95bf2501bc1e86780/frontends/qt/resources/deb-afterinstall.sh
        https://raw.githubusercontent.com/digitalbitbox/bitbox-wallet-app/master/LICENSE)
sha256sums=('5cdc3d15d3f133789585e9cc29aef983993af7a91df3ad28bcc8cb07cab365d7'
            '7b89151aa6b525d1b370d8224fe9191f1ad6a3b9e0beb02c745585b5e1dd02d5')

prepare() {
  sed -i -r 's/\/etc\/udev\/rules.d\///' ${srcdir}/deb-afterinstall.sh
  sed -i -r 's/udevadm control --reload//' ${srcdir}/deb-afterinstall.sh
  sed -i -r 's/udevadm trigger//' ${srcdir}/deb-afterinstall.sh
}

build() {
  chmod +x ${srcdir}/deb-afterinstall.sh
  ${srcdir}/deb-afterinstall.sh
}

package() {
  install -Dm 644 51-hid-digitalbitbox.rules "$pkgdir"/usr/lib/udev/rules.d/51-hid-digitalbitbox.rules
  install -Dm 644 52-hid-digitalbitbox.rules "$pkgdir"/usr/lib/udev/rules.d/52-hid-digitalbitbox.rules
  install -Dm 644 53-hid-bitbox02.rules "$pkgdir"/usr/lib/udev/rules.d/53-hid-bitbox02.rules
  install -Dm 644 54-hid-bitbox02.rules "$pkgdir"/usr/lib/udev/rules.d/54-hid-bitbox02.rules
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
