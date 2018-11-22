# Mantainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: RunningDroid <runningdroid AT zoho.com>
# Contributor: Sebastian Lindqvist <dunpin@gmail.com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Marcel O'Neil <marcel@marceloneil.com>

#
# ThomasV PGP key: gpg --recv-key 6694D8DE7BE8EE5631BED9502BD5824B7F9470E6
# http://bitcoin-otc.com/viewgpg.php?nick=ThomasV
#

pkgname=electrum-git
pkgver=20181120
pkgrel=1
pkgdesc="Lightweight Bitcoin wallet"
arch=('any')
depends=('hicolor-icon-theme'
         'libsecp256k1'
         'python'
         'python-dnspython'
         'python-ecdsa'
         'python-jsonrpclib-pelix'
         'python-protobuf'
         'python-pyaes'
         'python-pyqt5'
         'python-pysocks'
         'python-qdarkstyle'
         'python-qrcode'
         'python-requests'
         'python-six'
         'python-websocket-client'
	 'python-aiohttp_socks'
         'qt5-base')
checkdepends=('python-tox')
makedepends=('gettext'
             'git'
             'protobuf'
             'python-pycurl'
             'python-setuptools')
optdepends=('desktop-file-utils: update desktop icon'
            'gtk-update-icon-cache: update desktop icon'
            'python-amodem: air-gapped transaction signing over audio modem'
            'python-btchip: Ledger hardware wallet support'
            'python-hidapi: Digital Bitbox hardware wallet support'
            'python-pycryptodomex: use PyCryptodome AES implementation instead of pyaes'
            'python-keepkey: KeepKey hardware wallet support'
            'python-matplotlib: plot transaction history in graphical mode'
            'python-rpyc: send commands to Electrum Python console from an external script'
            'python-safet: Archos Safe-T hardware wallet support'
            'python-trezor: Trezor hardware wallet support'
            'xdg-utils: update desktop icon'
            'zbar: QR code reading support')
url="https://github.com/spesmilo/electrum"
license=('MIT')
source=(git+https://github.com/spesmilo/electrum)
sha256sums=('SKIP')
provides=('electrum')
conflicts=('electrum')
install=electrum.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Compiling icons...'
  pyrcc5 icons.qrc -o electrum/gui/qt/icons_rc.py

  msg2 'Compiling protobuf description file...'
  protoc \
    --proto_path=electrum \
    --python_out=electrum \
    electrum/paymentrequest.proto

  msg2 'Creating translations...'
  python contrib/make_locale

  msg2 'Building...'
  python setup.py build
}

check() {
  cd ${pkgname%-git}

  #_pyver="$(pacman -Q python | awk '{print $2}' | awk -F. '{print $1 $2}')"
  _pyver="$(python -c \
    'import platform; print("%s%s" % platform.python_version_tuple()[0:2])')"

  msg2 'Testing...'
  tox -e "py$_pyver"
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
