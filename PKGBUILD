# Maintainer: bitcoinlizard <bitcoinlizard@fastmail.com>

pkgname=python-hwilib
pkgver=2.0.2
pkgrel=3
pkgdesc="The Bitcoin Hardware Wallet Interface is a Python library and command line tool for interacting with hardware wallets."
arch=('any')
url="https://github.com/bitcoin-core/HWI"
license=('MIT')
makedepends=('python-setuptools' 'qt5-base')
depends=('python' 'libusb' 'systemd-libs' 'pyside2' 'pyside2-tools' 'python-libusb1' 'python-base58' 'python-bitbox02' 'python-hidapi' 'python-cryptography' 'python-mnemonic' 'python-noiseprotocol-git')

source=("https://github.com/bitcoin-core/HWI/archive/refs/tags/${pkgver}.tar.gz"
        "generate-ui.patch")
sha256sums=('fe240431f8395e51e078a6688b48384d6118c10f5a3bd44b1c3bb186fd9f1841'
            '6785afd23f30cf2f98f796896f131eed869b3e4d3ea25ed57ba0eac5c53ec165')

prepare() {
  cd "HWI-${pkgver}/contrib"
  patch --forward --strip=1 --input="${srcdir}/generate-ui.patch"
}

build() {
  cd "HWI-${pkgver}"
  sh contrib/generate-ui.sh
  python setup.py build
}

package() {
  cd "HWI-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Install license since the package doesn't include it
  install -Dm 644 "$srcdir/HWI-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
