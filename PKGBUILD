pkgname=electrum-ltc-git
pkgver=3.2.2.git20180729.062669a0
pkgrel=1
pkgdesc='Lightweight Litecoin client'
arch=(any)
url=https://electrum-ltc.org/
license=(MIT)
depends=(python-btchip
         python-dnspython
         python-ecdsa
         python-jsonrpclib-pelix
         python-matplotlib
         python-protobuf
         python-pyaes
         python-pycryptodomex
         python-pyqt5
         python-pysocks
         python-qrcode
         python-requests
         python-scrypt
         python-websocket-client
         zbar)
makedepends=(git)
source=(git+https://github.com/pooler/electrum-ltc.git)
sha256sums=(SKIP)

pkgver() {
  cd electrum-ltc
  printf %s.git%s "$(grep -om1 '[0-9.]*' electrum_ltc/version.py)" \
                  "$(git log -1 --format=%cd.%h --date=short | tr -d -)"
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

  ./setup.py install -O1 --root="$pkgdir"

  install -Dm644 AUTHORS README.rst RELEASE-NOTES electrum-ltc.conf.sample \
          -t "$pkgdir"/usr/share/doc/electrum-ltc

  install -Dm644 LICENCE -t "$pkgdir"/usr/share/licenses/$pkgname
}
