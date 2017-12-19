# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: RunningDroid <runningdroid AT zoho.com>
# Contributor: Sebastian Lindqvist <dunpin@gmail.com>

#
# ThomasV PGP key: gpg --recv-key 6694D8DE7BE8EE5631BED9502BD5824B7F9470E6
# http://bitcoin-otc.com/viewgpg.php?nick=ThomasV
#

pkgname=electrum-git
pkgver=20170929
pkgrel=1
pkgdesc="Lightweight Bitcoin wallet"
arch=('any')
depends=('hicolor-icon-theme'
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
         'qt5-base')
makedepends=('gettext'
             'git'
             'protobuf'
             'python-pycurl'
             'python-setuptools')
optdepends=('desktop-file-utils: update desktop icon'
            'gtk-update-icon-cache: update desktop icon'
            'python-amodem: air-gapped transaction signing over audio modem'
            'python-btchip: Ledger hardware wallet support'
            'python-pycryptodomex: use PyCryptodome AES implementation instead of pyaes'
            'python-keepkey: KeepKey hardware wallet support'
            'python-matplotlib: plot transaction history in graphical mode'
            'python-rpyc: send commands to Electrum Python console from an external script'
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
  pyrcc5 icons.qrc -o gui/qt/icons_rc.py

  msg2 'Compiling protobuf description file...'
  protoc --proto_path=lib/ --python_out=lib/ lib/paymentrequest.proto

  msg2 'Creating translations...'
  python contrib/make_locale

  msg2 'Building...'
  python setup.py build
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
