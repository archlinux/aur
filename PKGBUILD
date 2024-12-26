# Maintainer: Matthew Tran <0e4ef622@gmail.com>
# Contributor: Marcel O'Neil <marcel at marceloneil dot com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: RunningDroid <runningdroid AT zoho.com>
# Contributor: Sebastian Lindqvist <dunpin@gmail.com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname='electron-cash'
pkgdesc='Lightweight Bitcoin Cash wallet'
pkgver=4.4.2
secp256k1ver=0.20.9
electrum_locale_commit=89ce57ff1fa0fbd0135888014c854c142753a166
pkgrel=2
url='http://www.electroncash.org/'
arch=('any')
license=('MIT')
makedepends=(
  'automake'
  'autoconf'
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
  'python-pathvalidate>=3.0.0'
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
  'python-zxing-cpp: QR code reading support'
  'gst-plugins-good: QR code reading support'
  'qt5-multimedia: QR code reading support'
)
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Electron-Cash/Electron-Cash/archive/${pkgver}.tar.gz"
        "secp256k1-${secp256k1ver}.tar.gz::https://github.com/Electron-Cash/secp256k1/archive/v${secp256k1ver}.tar.gz"
        "electrum-locale-${electrum_locale_commit}.tar.gz::https://github.com/Electron-Cash/electrum-locale/archive/${electrum_locale_commit}.tar.gz"
        "fix-certs.patch")
sha256sums=('7b89b99dca0c374eb5e6e210c71bb645d5e951ddebaf495bbb4537f18b5edc20'
            '68e84775e57da77e19ccb6b0dde6ca0882377bdd48ecc6da0047a70201ec64c8'
            'd232f958cc3c048f8dd3d17333be0cf7ee6f0d5776300bff1da55f2397544c09'
            'SKIP')

prepare() {
  rmdir "Electron-Cash-${pkgver}/contrib/secp256k1"
  rmdir "Electron-Cash-${pkgver}/contrib/electrum-locale"
  ln -s "${PWD}/secp256k1-${secp256k1ver}" "Electron-Cash-${pkgver}/contrib/secp256k1"
  ln -s "${PWD}/electrum-locale-${electrum_locale_commit}" "Electron-Cash-${pkgver}/contrib/electrum-locale"

  sed -i 's/py\.test/pytest/'  "Electron-Cash-${pkgver}/tox.ini"

  cd "Electron-Cash-${pkgver}"
  patch -Np1 -i "${srcdir}/fix-certs.patch"
}

build() {
  export GIT_SUBMODULE_SKIP=1;

  cd "Electron-Cash-${pkgver}"

  # python2-pyqt5 and qt5-base are needed for _only_ the icons...

  # Compile the icons file for Qt:
  pyrcc5 icons.qrc -o electroncash_gui/qt/icons_rc.py
  # Compile the protobuf description file:
  protoc --proto_path=electroncash/ --python_out=electroncash/ electroncash/paymentrequest.proto
  protoc --proto_path=electroncash_plugins/fusion/protobuf/ --python_out=electroncash_plugins/fusion/ electroncash_plugins/fusion/protobuf/fusion.proto
  # Create translations (optional):
  python contrib/make_locale
  # Use libsecp
  bash contrib/make_secp
  # Build
  python setup.py build
}

check() {
  cd "Electron-Cash-${pkgver}"

  tox -e py313 -- --ignore-glob='*regtest*'
}

package() {
  cd "Electron-Cash-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
