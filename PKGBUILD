# Maintainer: bitcoinlizard <bitcoinlizard at fastmail dot com>

pkgname=python-hwilib
pkgver=3.1.0
pkgrel=3
pkgdesc="The Bitcoin Hardware Wallet Interface is a Python library and command line tool for interacting with hardware wallets."
arch=('any')
url="https://github.com/bitcoin-core/HWI"
license=('MIT')
_backend=(python-poetry-core)
makedepends=('qt5-base' 'python-poetry-core' 'python-poetry-plugin-export' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
depends=('python' 'python-poetry' 'python-keyring' 'python-dulwich' 'libusb' 'systemd-libs' 'pyside2' 'pyside2-tools' 'python-libusb1' 'python-semver' 'python-base58' 'python-hidapi' 'python-cryptography' 'python-typing_extensions' 'python-mnemonic' 'python-noiseprotocol' 'python-ecdsa' 'python-pyaes' 'python-cbor2' 'python-pyserial' 'python-protobuf' 'python-numpy' 'pybind11' 'python-pbs-installer' 'python-zstandard')

source=("https://github.com/bitcoin-core/HWI/archive/refs/tags/${pkgver}.tar.gz"
        "generate-ui.patch")
sha256sums=('8a28f4a7950bcdb430ef8f05fbd26ae11a51cf769f47f5ee2175e0eb4e0a234e'
            '6785afd23f30cf2f98f796896f131eed869b3e4d3ea25ed57ba0eac5c53ec165')

prepare() {
  cd "HWI-${pkgver}/contrib"
  patch --forward --strip=1 --input="${srcdir}/generate-ui.patch"
}

build() {
  cd "HWI-${pkgver}"
  sh contrib/generate-ui.sh
  python -m build --wheel --no-isolation
}

package() {
  cd "HWI-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install license since the package doesn't include it
  install -Dm 644 "$srcdir/HWI-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
