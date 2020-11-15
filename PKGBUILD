# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: RunningDroid <runningdroid AT zoho.com>
# Contributor: Sebastian Lindqvist <dunpin@gmail.com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Marcel O'Neil <marcel@marceloneil.com>

pkgname=electrum-git
pkgver=4.0.4.r70.gec0f91942
pkgrel=1
pkgdesc="Lightweight Bitcoin wallet"
arch=('any')
url="https://github.com/spesmilo/electrum"
license=('MIT')
depends=('hicolor-icon-theme'
         'libsecp256k1'
         'python'
         'python-ecdsa'
         'python-qrcode'
         'python-protobuf'
         'python-dnspython'
         'python-qdarkstyle'
         'python-aiorpcx-git'
         'python-aiohttp'
         'python-aiohttp-socks'
         'python-certifi'
         'python-bitstring'
         'python-attrs'
         'python-cryptography'
         'python-requests'
         'python-six'
         'python-pyqt5'
         'qt5-base')
checkdepends=('python-tox')
makedepends=('gettext'
             'git'
             'protobuf'
             'python-pycurl'
             'python-setuptools')
optdepends=('desktop-file-utils: update desktop icon'
            'gtk-update-icon-cache: update desktop icon'
            'python-hidapi: Digital Bitbox hardware wallet support'
            'python-trezor: Trezor hardware wallet support'
            'python-safet: Archos Safe-T hardware wallet support'
            'python-keepkey: KeepKey hardware wallet support'
            'python-btchip: Ledger hardware wallet support'
            'python-ckcc-protocol: Coldcard wallet hardware support'
            'python-bitbox02: BitBox wallet hardware support'
            'python-matplotlib: plot transaction history in graphical mode'
            'python-rpyc: send commands to Electrum Python console from an external script'
            'xdg-utils: update desktop icon'
            'python-amodem: air-gapped transaction signing over audio modem'
            'zbar: QR code reading support')
source=(git+https://github.com/spesmilo/electrum)
sha256sums=('SKIP')
provides=('electrum')
conflicts=('electrum')
install=electrum.install

pkgver() {
  cd ${pkgname%-git}
#  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname%-git}

  echo 'Initializing git submodule...'
  git submodule init

  echo 'Compiling protobuf description file...'
  protoc \
    --proto_path=electrum \
    --python_out=electrum \
    electrum/paymentrequest.proto

  echo 'Creating translations...'
  python contrib/pull_locale

  echo 'Building...'
  python setup.py build
}

check() {
  cd ${pkgname%-git}

  #_pyver="$(pacman -Q python | awk '{print $2}' | awk -F. '{print $1 $2}')"
  _pyver="$(python -c \
    'import platform; print("%s%s" % platform.python_version_tuple()[0:2])')"

  echo 'Testing...'
  tox -e "py$_pyver"
}

package() {
  cd ${pkgname%-git}

  echo 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 AUTHORS README.rst RELEASE-NOTES -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 LICENCE -t "$pkgdir"/usr/share/licenses/$pkgname
}
