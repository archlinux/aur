pkgname=electrum-ltc
pkgver=3.3.6.1
pkgrel=1
pkgdesc='Litecoin thin client'
arch=(any)
url=https://electrum-ltc.org/
license=(MIT)
depends=(desktop-file-utils
         libsecp256k1
         python-aiohttp
         python-aiohttp-socks
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
makedepends=(python-requests)
source=(
  "electrum-ltc-$pkgver.tar.gz::https://codeload.github.com/pooler/electrum-ltc/tar.gz/$pkgver"
)
sha256sums=(8c5ab5f496bc0dcedb6efcf7dee4c936dcf6fddbea58ebb081b4aa4bb2faf624)

prepare() {
  sed -E 's/sh.*(electrum.*)"/\1/' -i electrum-ltc-$pkgver/electrum-ltc.desktop
}

build() {
  cd electrum-ltc-$pkgver
  protoc --proto_path=electrum_ltc --python_out=electrum_ltc electrum_ltc/paymentrequest.proto
  contrib/make_locale
  ./setup.py build
}

package() {
  cd electrum-ltc-$pkgver
  ./setup.py install -O1 --root="$pkgdir" --skip-build
  install -Dm644 AUTHORS README.rst RELEASE-NOTES -t "$pkgdir"/usr/share/doc/electrum-ltc
  install -Dm644 LICENCE -t "$pkgdir"/usr/share/licenses/$pkgname
}
