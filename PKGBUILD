# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Maintainer: Marcel O'Neil <marcel@marceloneil.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: RunningDroid <runningdroid AT zoho.com>
# Contributor: Sebastian Lindqvist <dunpin@gmail.com>

pkgname='electron-cash'
pkgdesc='Lightweight Bitcoin Cash wallet'
pkgver=3.3
pkgrel=1
url='http://www.electroncash.org/'
install="${pkgname}.install"
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
  'python'
  'python-dnspython'
  'python-ecdsa'
  'python-jsonrpclib-pelix'
  'python-pbkdf2'
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
  'desktop-file-utils: update desktop icon'
  'gtk-update-icon-cache: update desktop icon'
  'python-btchip: Ledger hardware wallet support'
  'python-hidapi: Digital Bitbox hardware wallet support'
  'python-pycryptodomex: use PyCryptodome AES implementation instead of pyaes'
  'python-matplotlib: plot transaction history in graphical mode'
  'python-rpyc: send commands to Electrum Python console from an external script'
  'xdg-utils: update desktop icon'
  'zbar: QR code reading support'
)
provides=("${pkgname}")
conflicts=("${pkgname}")
install="${pkgname}.install"
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/fyookball/electrum/archive/${pkgver/.0}.tar.gz"
  "${pkgname}.install")
sha256sums=('92df7f89321cda8f6d886c203298daa1bf8463ff25a5d58b93907579d181f7f8'
            'd682766321f9981ee38aee26dc050209882d8c1c6006e3e509649b47fa1bb073')

build() {
  cd "${pkgname/on-cash/um}-${pkgver/.0}"

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
  cd "${pkgname/on-cash/um}-${pkgver/.0}"

  tox -e py36
}

package() {
  cd "${pkgname/on-cash/um}-${pkgver/.0}"

  python setup.py install --root="${pkgdir}" --optimize=1
}


# vim: ts=2 sw=2 et:
