pkgname=electrum-ltc
pkgver=2.8.3.2
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
source=(https://electrum-ltc.org/download/Electrum-LTC-$pkgver.tar.gz
        https://electrum-ltc.org/download/Electrum-LTC-$pkgver.tar.gz.asc)
validpgpkeys=(CAE1092AD3553FFD21C05DE36FC4C9F7F1BE8FEA)
sha256sums=(e3000130dc9e64a70d8ecacf604e2ebd36501e34ab8d53d7084e5be7c03126b2
            SKIP)

prepare() {
  cd Electrum-LTC-$pkgver/

  find ./ -type f -exec sed -i '/#!/s/python$/&2/' {} +

  for i in icons/{electrum_{dark,light}_icon,unpaid}.png
  do convert $i $i
  done
  pyrcc4 icons.qrc >gui/qt/icons_rc.py

  sed -i '/fee_widgets.append((rbf_label, rbf_combo))/d
          s/set_rbf(True)/set_rbf(False)/' gui/qt/main_window.py
  sed -i 's/, rbf=False//; s/, rbf//' lib/commands.py
}

build() {
  cd Electrum-LTC-$pkgver/

  ./setup.py build
}

package() {
  cd Electrum-LTC-$pkgver/

  ./setup.py install -O1 --root=$pkgdir

  mkdir -p $pkgdir/usr/share/doc/$pkgname/
  cp AUTHORS README.rst RELEASE-NOTES electrum-ltc.conf.sample $pkgdir/usr/share/doc/$pkgname/

  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  cp LICENCE $pkgdir/usr/share/licenses/$pkgname/
}
