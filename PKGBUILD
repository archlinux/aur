# Maintainer: Marcel O'Neil <marcel@marceloneil.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: RunningDroid <runningdroid AT zoho.com>
# Contributor: Sebastian Lindqvist <dunpin@gmail.com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname='electron-cash'
pkgdesc='Lightweight Bitcoin Cash wallet'
pkgver=4.0.14
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
)
optdepends=(
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
        "tox.ini.patch")
sha256sums=('f7aee5dace72e7f508d80a813cbaa92bc5d4d4c4be77d9f00b1edb21b77b882a'
            '39c85a1eec8fcdc7fa80d47ff464e023b092cc623dce7fd6f42abe547c017ecb')

prepare() {
  cd "Electron-Cash-${pkgver}"

  # Patch tox.ini to use the latest pip
  patch --forward --strip=1 --input="${srcdir}/tox.ini.patch"
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
  # Build
  python setup.py build
}

check() {
  cd "Electron-Cash-${pkgver}"

  tox -e py38
}

package() {
  cd "Electron-Cash-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
