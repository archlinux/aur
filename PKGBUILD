# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: lukpod <lukpod9@ya.ru>

pkgname=electrum-ltc-git
_pkgname=electrum_ltc
pkgver=4.3.2.git20221105.f9cbfac
pkgrel=2
pkgdesc='Litecoin thin client'
arch=(any)
url=https://electrum-ltc.org/
license=(MIT)
depends=('hicolor-icon-theme'
         'libsecp256k1'
         'python'
         'python-dnspython'
         'python-protobuf'
         'python-pyqt5'
         'python-qdarkstyle'
         'python-qrcode'
         'python-requests'
         'python-six'
         'python-websocket-client'
	 'python-aiohttp-socks'
	 'python-certifi'
	 'python-aiorpcx'
	 'python-aiohttp'
         'python-scrypt'
         'qt5-base'
         'python-cryptography'
         'python-bitstring'
         'python-attrs')
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
            'python-keepkey: KeepKey hardware wallet support'
            'python-matplotlib: plot transaction history in graphical mode'
            'python-rpyc: send commands to Electrum Python console from an external script'
            'python-safet: Archos Safe-T hardware wallet support'
            'python-trezor: Trezor hardware wallet support'
            'python-bitbox02: BitBox wallet hardware support'
            'python-cbor: Blockstream Jade hardware wallet communication'
            'python-pyserial: Blockstream Jade hardware wallet serial port extension'
            'xdg-utils: update desktop icon'
            'zbar: QR code reading support')
source=(git+https://github.com/pooler/electrum-ltc)
sha256sums=('SKIP')
provides=('electrum-ltc')
conflicts=('electrum-ltc')

pkgver() {
  cd ${pkgname%-git}
  printf %s.git%s "$(grep -om1 "'.*'" electrum_ltc/version.py | tr -d "'" )" \
                  "$(git log -1 --format=%ad.%h --date=format:%Y%m%d --abbrev=7)"
}

prepare() {
  cd ${pkgname%-git}
  git submodule update --init
  contrib/make_libsecp256k1.sh
#  contrib/pull_locale  https://github.com/spesmilo/electrum/issues/9531
  patch --forward --strip=1 --input="../../electrum-ltc-aiorpcx-version-patch.diff"
}

build() {
  cd ${pkgname%-git}
  protoc --proto_path=electrum_ltc --python_out=electrum_ltc electrum_ltc/paymentrequest.proto
  ./setup.py build
}

check() {
  cd ${pkgname%-git}

  #_pyver="$(pacman -Q python | awk '{print $2}' | awk -F. '{print $1 $2}')"
  _pyver="$(python -c \
    'import platform; print("%s%s" % platform.python_version_tuple()[0:2])')"

  echo 'Testing...'
#  tox -e "py$_pyver"
}

package() {
  cd ${pkgname%-git}
  ./setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 contrib/secp256k1/dist/lib/libsecp256k1.so.0 -t "$pkgdir"/usr/lib/python3.13/site-packages/$_pkgname
  install -Dm644 AUTHORS README.md RELEASE-NOTES -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 LICENCE -t "$pkgdir"/usr/share/licenses/$pkgname
}
