pkgname=electrum-ltc
pkgver=2.8.3+20170402
_commit=d998b00e6c66fb6c44a8eb73a8df1548ef2b2d25
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
makedepends=(python2-pycurl)
source=($pkgname-$_commit.tar.gz::https://codeload.github.com/pooler/$pkgname/tar.gz/$_commit)
sha256sums=(987f4841470a0ad80efe1b4356378d74c9f80a13aed59c39bca3ba4ac4e0aef4)

prepare() {
  cd $pkgname-$_commit/

  find . -type f -exec sed -i '/#!/s/python$/&2/' {} +

  for i in $(echo icons/{electrum_{dark,light}_icon,unpaid}.png)
  do convert $i $i
  done

  sed -i '/fee_widgets.append((rbf_label, rbf_combo))/d
          /set_rbf(True)/s/True/False/' gui/qt/main_window.py
  sed -i 's/, rbf=False//
          s/, rbf//' lib/commands.py
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

  ./setup.py install --root=$pkgdir -O1

  mkdir -p $pkgdir/usr/share/doc/$pkgname/
  cp AUTHORS LICENCE README.rst RELEASE-NOTES electrum-ltc.conf.sample \
    $pkgdir/usr/share/doc/$pkgname/

  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  ln -rs $pkgdir/usr/share/doc/$pkgname/LICENCE $pkgdir/usr/share/licenses/$pkgname/
}
