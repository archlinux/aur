pkgname=electrum-ltc-git
pkgver=3.1.3.1.git20180419.5672ca65
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
         python-pbkdf2
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
  printf %s.git%s "$(grep -om1 '[0-9.]*' lib/version.py)" \
                  "$(git log -1 --format=%cd.%h --date=short | tr -d -)"
}

build() {
  cd electrum-ltc
  pyrcc5 icons.qrc >gui/qt/icons_rc.py
  protoc --proto_path=lib --python_out=lib lib/paymentrequest.proto
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
