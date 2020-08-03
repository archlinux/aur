# Maintainer: Matthew Tran <0e4ef622@gmail.com>
# Contributor: Marcel O'Neil <marcel at marceloneil dot com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: RunningDroid <runningdroid AT zoho.com>
# Contributor: Sebastian Lindqvist <dunpin@gmail.com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname='electron-cash'
pkgdesc='Lightweight Bitcoin Cash wallet'
pkgver=4.1.0
secp256k1ver=0.20.9
pkgrel=4
url='http://www.electroncash.org/'
arch=('any')
license=('MIT')
makedepends=(
  'automake'
  'git'
  'libtool'
  'protobuf'
  'python-requests'
  'python-setuptools'
  'python-tox'
)
depends=(
  'hicolor-icon-theme'
  'python'
  'python-dateutil'
  'python-dnspython'
  'python-ecdsa'
  'python-jsonrpclib-pelix'
  'python-protobuf'
  'python-pyaes'
  'python-pyqt5'
  'python-pysocks'
  'python-qrcode'
  'python-requests'
  'python-six'
  'python-stem'
  'qt5-base'
  'qt5-svg'
  'ttf-bitstream-vera'
  'python-certifi'
)
optdepends=(
  'tor: Tor support'
  'python-btchip: Ledger hardware wallet support'
  'python-hidapi: Digital Bitbox hardware wallet support'
  'python-matplotlib: plot transaction history in graphical mode'
  'python-pycryptodomex: use PyCryptodome AES implementation instead of pyaes'
  'python-qdarkstyle: optional dark theme in graphical mode'
  'python-rpyc: send commands to Electrum Python console from an external script'
  'python-trezor: Trezor hardware wallet support'
  'python-keepkey: Trezor hardware wallet support'
  'zbar: QR code reading support'
)
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Electron-Cash/Electron-Cash/archive/${pkgver}.tar.gz"
        "secp256k1-${secp256k1ver}.tar.gz::https://github.com/Bitcoin-ABC/secp256k1/archive/v${secp256k1ver}.tar.gz")
sha256sums=('c5eeb22219303939b2c227944b4dd12895c49853405adef7dbd92ba4b4485dd2'
            '68e84775e57da77e19ccb6b0dde6ca0882377bdd48ecc6da0047a70201ec64c8')

prepare() {
  rmdir "Electron-Cash-${pkgver}/contrib/secp256k1"
  ln -s "${PWD}/secp256k1-${secp256k1ver}" "Electron-Cash-${pkgver}/contrib/secp256k1"
}

build() {
  cd "Electron-Cash-${pkgver}"

  # python2-pyqt5 and qt5-base are needed for _only_ the icons...

  # Compile the icons file for Qt:
  pyrcc5 icons.qrc -o gui/qt/icons_rc.py
  # Compile the protobuf description file:
  protoc --proto_path=lib/ --python_out=lib/ lib/paymentrequest.proto
  # Create translations (optional):
  python contrib/make_locale
  # Use libsecp
  bash contrib/make_secp
  # Build
  python setup.py build
}

check() {
  cd "Electron-Cash-${pkgver}"

  # there's a broken test in 4.1.0
  # tox -e py38
}

package() {
  cd "Electron-Cash-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
