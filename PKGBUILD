pkgname=electrum-ltc
pkgver=2.8.3pre.git20170510
pkgrel=1
pkgdesc='Lightweight Litecoin client'
arch=(any)
url=https://electrum-ltc.org/
license=(MIT)
depends=(python2-btchip
         python2-dnspython
         python2-ecdsa
         python2-jsonrpclib
         python2-ltc_scrypt
         python2-matplotlib
         python2-pbkdf2
         python2-protobuf
         python2-pyaes
         python2-pycryptodomex
         python2-pyqt4
         python2-pysocks
         python2-qrcode
         python2-requests
         zbar)
makedepends=(gettext python2-pycurl)
_commit=9c86d29
source=($pkgname-$_commit.tar.gz::https://codeload.github.com/pooler/$pkgname/tar.gz/$_commit)
sha256sums=(152b50ca5a70913bc44c11d0d94bc6bb18d9f8a44eda7b386f7cc778d303f011)

prepare() {
  cd $pkgname-$_commit/

  find ./ -type f -exec sed -i '/#!/s/python$/&2/' {} +

  for i in icons/{electrum_{dark,light}_icon,unpaid}.png
  do convert $i $i
  done

  sed -i '/fee_widgets.append((rbf_label, rbf_combo))/d
          s/set_rbf(True)/set_rbf(False)/' gui/qt/main_window.py
  sed -i 's/, rbf=False//; s/, rbf//' lib/commands.py
}

build() {
  cd $pkgname-$_commit/

  pyrcc4 icons.qrc >gui/qt/icons_rc.py
  protoc --proto_path=lib/ --python_out=lib/ lib/paymentrequest.proto
  contrib/make_locale
  ./setup.py build
}

package() {
  cd $pkgname-$_commit/

  ./setup.py install -O1 --root=$pkgdir

  mkdir -p $pkgdir/usr/share/doc/$pkgname/
  cp AUTHORS README.rst RELEASE-NOTES electrum-ltc.conf.sample $pkgdir/usr/share/doc/$pkgname/

  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  cp LICENCE $pkgdir/usr/share/licenses/$pkgname/
}
