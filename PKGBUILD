pkgname=electrum-ltc
pkgver=2.7.17
pkgrel=1
pkgdesc='Lightweight Litecoin client'
arch=(any)
url=https://electrum-ltc.org/
license=(MIT)
depends=(python2-btchip python2-dnspython python2-ecdsa python2-jsonrpclib python2-ltc_scrypt
         python2-matplotlib python2-pbkdf2 python2-protobuf python2-pyqt4 python2-qrcode
         python2-requests python2-slowaes zbar)
makedepends=(python2-pycurl python2-setuptools)
_commit=608df09
source=($pkgname-$_commit.tar.gz::https://codeload.github.com/pooler/$pkgname/tar.gz/$_commit)
sha256sums=(e8c63c5eb090edf23a156ec2317f7803c34102c121eac8a77e8d8ea567432f15)

prepare() {
  cd $pkgname-$_commit/

  find -type f -exec sed -i '/^!#/ ! s/python$/python2/' {} +
}

build() {
  cd $pkgname-$_commit/

  pyrcc4 icons.qrc > gui/qt/icons_rc.py

  ./contrib/make_locale

  ./setup.py build
}

package() {
  cd $pkgname-$_commit/

  ./setup.py install --root=$pkgdir -O1

  install -d $pkgdir/usr/share/doc/$pkgname/
  install -m644 AUTHORS LICENCE README.rst RELEASE-NOTES $pkgdir/usr/share/doc/$pkgname/

  install -d $pkgdir/usr/share/licenses/$pkgname/
  ln -rs $pkgdir/usr/share/doc/$pkgname/LICENCE $pkgdir/usr/share/licenses/$pkgname/
}
