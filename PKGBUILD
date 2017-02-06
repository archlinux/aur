pkgname=electrum-ltc
pkgver=2.7.17
_commit=e13e590
pkgrel=3
pkgdesc='Lightweight Litecoin client'
arch=(any)
url=https://electrum-ltc.org/
license=(MIT)
depends=(python2-btchip python2-dnspython python2-ecdsa python2-jsonrpclib python2-ltc_scrypt
         python2-matplotlib python2-pbkdf2 python2-protobuf python2-pyqt4 python2-qrcode
         python2-requests python2-slowaes zbar)
makedepends=(python2-pycurl)
source=($pkgname-$_commit.tar.gz::https://codeload.github.com/pooler/$pkgname/tar.gz/$_commit)
sha256sums=(a2593e63a0ff748d4e776aa2a5a012482df2f07c3bf5e651e230f9bfdb7c0f5d)

prepare() {
  cd $pkgname-$_commit/

  find -type f -exec sed -i '/^#!/ s/python$/&2/' {} +

  sed -i '/rbf_checkbox.setVisible/ s/(.*)/(False)/
          /rbf_cb = QCheckBox/ a\        rbf_cb.setVisible(False)' gui/qt/main_window.py
  sed -i 's/, rbf=False//
          s/, rbf//' lib/commands.py
}

build() {
  cd $pkgname-$_commit/

  pyrcc4 icons.qrc > gui/qt/icons_rc.py

  protoc --proto_path=lib/ --python_out=lib/ lib/paymentrequest.proto

  contrib/make_locale

  ./setup.py build
}

package() {
  cd $pkgname-$_commit/

  ./setup.py install --root=$pkgdir -O1

  install -d $pkgdir/usr/share/doc/$pkgname/
  install -m644 AUTHORS LICENCE README.rst RELEASE-NOTES electrum-ltc.conf.sample \
    $pkgdir/usr/share/doc/$pkgname/

  install -d $pkgdir/usr/share/licenses/$pkgname/
  ln -rs $pkgdir/usr/share/doc/$pkgname/LICENCE $pkgdir/usr/share/licenses/$pkgname/
}
