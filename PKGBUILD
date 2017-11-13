# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: RunningDroid <runningdroid AT zoho.com>
# Contributor: Sebastian Lindqvist <dunpin@gmail.com>

#
# ThomasV PGP key: gpg --recv-key 6694D8DE7BE8EE5631BED9502BD5824B7F9470E6
# http://bitcoin-otc.com/viewgpg.php?nick=ThomasV
#

pkgname='electron-cash-git'
pkgdesc="Lightweight Bitcoin Cash wallet"
pkgver=2.9.4.r0.gf493cadb
pkgrel=2
url='http://www.electroncash.org/'
install="${pkgname}.install"
arch=('any')
license=('MIT')
makedepends=(
  'git'
  'protobuf'
  'python2-pycurl'
  'python2-setuptools'
  'python2-tox'
)
depends=(
  'hicolor-icon-theme'
  'python2'
  'python2-dnspython'
  'python2-ecdsa'
  'python2-jsonrpclib-pelix'
  'python2-pbkdf2'
  'python2-protobuf'
  'python2-pyaes'
  'python2-pyqt4'
  'python2-pyqt5'
  'python2-pysocks'
  'python2-qrcode'
  'python2-requests'
  'python2-six'
  'qt4'
  'qt5-base'
)
optdepends=(
  'desktop-file-utils: update desktop icon'
  'gtk-update-icon-cache: update desktop icon'
  'python2-amodem: air-gapped transaction signing over audio modem'
  'python2-btchip: Ledger hardware wallet support'
  'python2-pycryptodomex: use PyCryptodome AES implementation instead of pyaes'
  'python2-keepkey: KeepKey hardware wallet support'
  'python2-matplotlib: plot transaction history in graphical mode'
  'python2-rpyc: send commands to Electrum Python console from an external script'
  'python2-trezor: Trezor hardware wallet support'
  'xdg-utils: update desktop icon'
  'zbar: QR code reading support'
)
provides=("${pkgname/-git/}")
conflicts=("${pkgname/-git/}")
source=(
  "${pkgname/-git}::git+https://github.com/fyookball/electrum.git"
  "${pkgname}.install"
)
sha256sums=(
  'SKIP'
  'd682766321f9981ee38aee26dc050209882d8c1c6006e3e509649b47fa1bb073'
)
install="${pkgname}.install"

pkgver() {
  cd "${pkgname/-git/}"

  git describe --long --tags \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname/-git/}"

  # Compile the icons file for Qt:
  python2-pyrcc5 icons.qrc -o gui/qt/icons_rc.py
  # Compile the protobuf description file:
  protoc --proto_path=lib/ --python_out=lib/ lib/paymentrequest.proto
  # Create translations (optional):
  python2 contrib/make_locale
  # Build
  python2 setup.py build
}

check() {
  cd "${pkgname/-git/}"

  tox2
}

package() {
  cd "${pkgname/-git/}"

  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim: ts=2 sw=2 et:
