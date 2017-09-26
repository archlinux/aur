pkgname=electrum-ltc
pkgver=2.9.3.1
pkgrel=1
pkgdesc="Lightweight Litecoin client"
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
source=(https://electrum-ltc.org/download/Electrum-LTC-$pkgver.tar.gz
        https://electrum-ltc.org/download/Electrum-LTC-$pkgver.tar.gz.asc)
validpgpkeys=(CAE1092AD3553FFD21C05DE36FC4C9F7F1BE8FEA)
sha256sums=(d931a5376b7f38fba7221b01b1010f172c4d662668adae5c38885a646d5ee530
            SKIP)

prepare() {
  cd Electrum-LTC-$pkgver/

  find ./ -type f -exec sed -i '/#!/s/python$/&2/' {} +

  for i in icons/{electrum_{dark,light}_icon,unpaid}.png
  do convert $i $i
  done
  pyrcc4 icons.qrc >gui/qt/icons_rc.py
}

build() {
  cd Electrum-LTC-$pkgver/
  ./setup.py build
}

package() {
  cd Electrum-LTC-$pkgver/

  ./setup.py install -O1 --root=$pkgdir/

  mkdir -p $pkgdir/usr/share/doc/electrum-ltc/
  cp AUTHORS README.rst RELEASE-NOTES electrum-ltc.conf.sample $pkgdir/usr/share/doc/electrum-ltc/

  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  cp LICENCE $pkgdir/usr/share/licenses/$pkgname/
}
