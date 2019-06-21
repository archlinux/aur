# Maintainer: Marcel O'Neil <marcel@marceloneil.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: RunningDroid <runningdroid AT zoho.com>
# Contributor: Sebastian Lindqvist <dunpin@gmail.com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname='electron-cash'
pkgdesc='Lightweight Bitcoin Cash wallet'
pkgver=4.0.7
pkgrel=1
url='http://www.electroncash.org/'
arch=('any')
license=('MIT')
makedepends=(
  'git'
  'protobuf'
  'python-requests'
  'python-setuptools'
  'python-tox'
)
depends=(
  'hicolor-icon-theme'
  'libsecp256k1'
  'python'
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
  'qt5-base'
)
optdepends=(
  'python-btchip: Ledger hardware wallet support'
  'python-hidapi: Digital Bitbox hardware wallet support'
  'python-matplotlib: plot transaction history in graphical mode'
  'python-pycryptodomex: use PyCryptodome AES implementation instead of pyaes'
  'python-qdarkstyle: optional dark theme in graphical mode'
  'python-rpyc: send commands to Electrum Python console from an external script'
  'zbar: QR code reading support'
)
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Electron-Cash/Electron-Cash/archive/${pkgver}.tar.gz")
sha256sums=('9d8719680c1f9f16e63228c019c2b7f36ff3a8255c77d0a7fae25332217f4154')

build() {
  cd "Electron-Cash-${pkgver}"

  # python2-pyqt5 and qt5-base are needed for _only_ the icons...

  # Compile the icons file for Qt:
  pyrcc5 icons.qrc -o gui/qt/icons_rc.py
  # Compile the protobuf description file:
  protoc --proto_path=lib/ --python_out=lib/ lib/paymentrequest.proto
  # Create translations (optional):
  python contrib/make_locale
  # Build
  python setup.py build
}

check() {
  cd "Electron-Cash-${pkgver}"

  tox -e py37
}

package() {
  cd "Electron-Cash-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
