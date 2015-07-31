# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: RunningDroid <runningdroid AT zoho.com>
# Contributor: Sebastian Lindqvist <dunpin@gmail.com>

#
# ThomasV PGP key: gpg --recv-key 6694D8DE7BE8EE5631BED9502BD5824B7F9470E6
# http://bitcoin-otc.com/viewgpg.php?nick=ThomasV
#

pkgname=electrum-git
pkgver=20150731
pkgrel=1
pkgdesc="Lightweight Bitcoin wallet"
arch=('any')
depends=('hicolor-icon-theme'
         'python2'
         'python2-dnspython'
         'python2-ecdsa'
         'python2-pbkdf2'
         'python2-protobuf'
         'python2-pyqt4'
         'python2-qrcode'
         'python2-requests'
         'python2-six'
         'python2-slowaes'
         'python2-tlslite'
         'qt4')
makedepends=('gettext'
             'git'
             'protobuf'
             'python2-pycurl'
             'python2-setuptools')
optdepends=('desktop-file-utils: update desktop icon'
            'gtk-update-icon-cache: update desktop icon'
            'python2-amodem: air-gapped transaction signing over audio modem'
            'python2-btchip: BTChip hardware wallet support'
            'python2-jsonrpclib: merchant script'
            'python2-matplotlib: plot transaction history in graphical mode'
            'python2-rpyc: send commands to Electrum Python console from an external script'
            'python2-trezor: TREZOR hardware wallet support'
            'xdg-utils: update desktop icon'
            'zbar: QR code reading support')
url="https://github.com/spesmilo/electrum"
license=('GPL3')
source=(git+https://github.com/spesmilo/electrum)
sha256sums=('SKIP')
provides=('electrum')
conflicts=('electrum')
install=electrum.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg2 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

build() {
  cd ${pkgname%-git}

  msg2 'Compiling icons...'
  pyrcc4 icons.qrc -o gui/qt/icons_rc.py

  msg2 'Compiling protobuf description file...'
  protoc --proto_path=lib/ --python_out=lib/ lib/paymentrequest.proto

  msg2 'Creating translations...'
  python2 contrib/make_locale

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
