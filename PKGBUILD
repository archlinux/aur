pkgname=electrum-ltc-git
pkgver=3.3.0.1.git20181220.4cdf224
pkgrel=1
pkgdesc='Litecoin thin client'
arch=(any)
url=https://electrum-ltc.org/
license=(MIT)
depends=(desktop-file-utils
         libsecp256k1
         python-aiohttp_socks
         python-aiorpcx
         python-btchip
         python-certifi
         python-dnspython
         python-ecdsa
         python-jsonrpclib-pelix
         python-matplotlib
         python-protobuf
         python-pyaes
         python-pycryptodomex
         python-pyqt5
         python-qrcode
         python-scrypt
         python-websocket-client
         zbar)
makedepends=(git python-requests)
source=(git+https://github.com/pooler/electrum-ltc.git)
sha256sums=(SKIP)

pkgver() {
  cd electrum-ltc
  printf %s.git%s "$(grep -om1 '[0-9.]*' electrum_ltc/version.py)" \
                  "$(git log -1 --format=%ad.%h --date=format:%Y%m%d --abbrev=7)"
}

prepare() {
  sed -e 's/Exec=.*electrum-ltc %u"/Exec=electrum-ltc %u/' \
      -e 's/Exec=.*electrum-ltc --testnet %u"/Exec=electrum-ltc --testnet %u/' \
      -i electrum-ltc/electrum-ltc.desktop
}

build() {
  cd electrum-ltc
  pyrcc5 icons.qrc >electrum_ltc/gui/qt/icons_rc.py
  protoc --proto_path=electrum_ltc --python_out=electrum_ltc electrum_ltc/paymentrequest.proto
  contrib/make_locale
  ./setup.py build
}

package() {
  cd electrum-ltc

  ./setup.py install -O1 --root="$pkgdir" --skip-build

  install -Dm644 AUTHORS README.rst RELEASE-NOTES -t "$pkgdir"/usr/share/doc/electrum-ltc

  install -Dm644 LICENCE -t "$pkgdir"/usr/share/licenses/$pkgname
}
