pkgname=electrum-ltc-git
pkgver=3.0.3.git20171221.f4c968f
pkgrel=1
pkgdesc="Lightweight Litecoin client"
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
         zbar)
makedepends=(gettext git)
source=(git+https://github.com/pooler/electrum-ltc.git)
sha256sums=(SKIP)

pkgver() {
  cd electrum-ltc/
  printf %s%s $(grep ELECTRUM_VERSION lib/version.py | cut -d\' -f2) \
              $(git log -1 --format=.git%cd.%h --date=short --abbrev=7 | tr -d -)
}

build() {
  cd electrum-ltc/
  pyrcc5 icons.qrc >gui/qt/icons_rc.py
  protoc --proto_path=lib/ --python_out=lib/ lib/paymentrequest.proto
  contrib/make_locale
  ./setup.py build
}

package() {
  cd electrum-ltc/

  ./setup.py install -O1 --root=$pkgdir/

  mkdir -p $pkgdir/usr/share/doc/electrum-ltc/
  cp AUTHORS README.rst RELEASE-NOTES electrum-ltc.conf.sample $pkgdir/usr/share/doc/electrum-ltc/

  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  cp LICENCE $pkgdir/usr/share/licenses/$pkgname/
}
