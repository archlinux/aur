pkgname=electrum-ltc
pkgver=3.1.3.1
pkgrel=4
pkgdesc='Litecoin thin client'
arch=(any)
url=https://electrum-ltc.org/
license=(MIT)
depends=(desktop-file-utils
         python-btchip
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
source=("https://electrum-ltc.org/download/Electrum-LTC-$pkgver.tar.gz"{,.asc}
        https://github.com/pooler/electrum-ltc/commit/4a3b5.diff)
validpgpkeys=(CAE1092AD3553FFD21C05DE36FC4C9F7F1BE8FEA)
sha256sums=(27d272f01584aeddf1a3268f6f2c18d9557ba7376d203241473f41e37ae8ac4f
            SKIP
            3618e1934fdfdccc014b813eddf0a2534fd186e1ac41e4caed8168dc6f83ca4d)

prepare() {
  cd Electrum-LTC-$pkgver

  sed -e 's/Exec=.*electrum-ltc %u"/Exec=electrum-ltc %u/' \
      -e 's/Exec=.*electrum-ltc --testnet %u"/Exec=electrum-ltc --testnet %u/' \
      -i electrum-ltc.desktop

  patch -Np1 <"$srcdir"/4a3b5.diff
}

build() {
  cd Electrum-LTC-$pkgver
  ./setup.py build
}

package() {
  cd Electrum-LTC-$pkgver

  ./setup.py install -O1 --root="$pkgdir" --skip-build

  install -Dm644 AUTHORS README.rst RELEASE-NOTES -t "$pkgdir"/usr/share/doc/electrum-ltc

  install -Dm644 LICENCE -t "$pkgdir"/usr/share/licenses/$pkgname
}
