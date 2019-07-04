# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: RunningDroid <runningdroid AT zoho.com>
# Contributor: Sebastian Lindqvist <dunpin@gmail.com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Marcel O'Neil <marcel@marceloneil.com>

pkgname=electrum-git
pkgver=20190703
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
	 'python-aiohttp-socks'
	 'python-certifi'
	 'python-aiorpcx-git'
	 'python-aiohttp'
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
            'python-ckcc-protocol: Coldcard wallet hardware support'
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
