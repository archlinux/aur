# Maintainer: Andrew Kallmeyer <ask@ask.systems>
# Contributor: Matthew Tran <0e4ef622@gmail.com>
# Contributor: Marcel O'Neil <marcel at marceloneil dot com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: RunningDroid <runningdroid AT zoho.com>
# Contributor: Sebastian Lindqvist <dunpin@gmail.com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname='oregano-wallet'
pkgdesc='Lightweight Ergon wallet'
pkgver=4.4.2
secp256k1ver=0.20.9
pkgrel=1
url='https://github.com/Ergon-moe/Oregano'
arch=('any')
license=('MIT')
makedepends=(
  'automake'
  'git'
  'libtool'
  'protobuf'
  'python-requests'
  'python-setuptools'
)
depends=(
  'hicolor-icon-theme'
  'python'
  'python-dateutil'
  'python-dnspython'
  'python-ecdsa'
  'python-jsonrpclib-pelix'
  'python-pathvalidate'
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
provides=('oregano')
conflicts=("${pkgname}" 'oregano')
source=("Oregano-${pkgver}.tar.gz::https://github.com/Ergon-moe/Oregano/archive/v${pkgver}.tar.gz"
        "secp256k1-${secp256k1ver}.tar.gz::https://github.com/Bitcoin-ABC/secp256k1/archive/v${secp256k1ver}.tar.gz")
sha256sums=('f6a549da5000301d241a6537c1d5ba9e167e1b1867c18e912c8403365902ab17'
            '68e84775e57da77e19ccb6b0dde6ca0882377bdd48ecc6da0047a70201ec64c8')

prepare() {
  rmdir "$srcdir/Oregano-$pkgver/contrib/secp256k1"
  ln -s "$srcdir/secp256k1-$secp256k1ver" "$srcdir/Oregano-$pkgver/contrib/secp256k1"
}

build() {
  export GIT_SUBMODULE_SKIP=1;
  cd "Oregano-$pkgver"

  # python2-pyqt5 and qt5-base are needed for _only_ the icons...
  # Compile the icons file for Qt:
  pyrcc5 icons.qrc -o oregano_gui/qt/icons_rc.py
  # Compile the protobuf description file:
  protoc --proto_path=oregano/ --python_out=oregano/ oregano/paymentrequest.proto
  # Create translations (optional):
  python contrib/make_locale
  # Use libsecp
  bash contrib/make_secp
  # Build
  python setup.py build
}

# Tests don't pass because they haven't been updated for ergon, they're still
# testing bitcoin cash addresses which doesn't work in the modified code
#
# Note: add 'python-tox' to makedepends to run this
#
#check() {
#  cd "Oregano-${pkgver}"
#  tox -e py310 --force-dep pycryptodomex~=3.10
#}

package() {
  cd "Oregano-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim: ts=2 sw=2 et:
