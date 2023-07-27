# Maintainer: Musee "lae" Ullah <lae(at)idolactiviti(dot)es>
pkgname=electrum-mona
pkgver=4.2.1
pkgrel=1
pkgdesc="A lightweight Monacoin wallet"
arch=('any')
url='https://github.com/wakiyamap/electrum-mona'
license=('MIT')
depends=('python-pyaes' 'python-ecdsa' 'python-pbkdf2' 'python-requests' 'python-qrcode'
         'python-protobuf' 'python-dnspython' 'python-jsonrpclib-pelix' 'python-pysocks'
         'python-pyqt5' 'python-pycryptodomex' 'python-websocket-client' 'python-certifi'
         'python-aiorpcx' 'python-aiohttp' 'python-aiohttp-socks'
         'libsecp256k1' 'python-bitstring' 'python-lyra2re_hash' 'gettext')
optdepends=('python-btchip: BTChip hardware wallet support'
            'python-hidapi: Digital Bitbox hardware wallet support'
            'python-matplotlib: plot transaction history in graphical mode'
            'zbar: QR code reading support'
            'python-rpyc: send commands to Electrum Python console from an external script'
            'python-qdarkstyle: optional dark theme in graphical mode'
            'python-trezor: for Trezor hardware support'
            'python-keepkey: for KeepKey hardware support')
makedepends=('python-pycurl' 'python-pip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wakiyamap/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('ee2dfe3a4c272bdb589543530a8f8d044b20a35e91aaf12dbb34f3f5712214fc2f8a15c0a3c0ac72b8d80d0b245745c98261fb88aefb35583f44f0aef7e6144d')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}/
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  sed -ri 's/(libsecp256k1\.so)\.0/\1/g' electrum_mona/ecc_fast.py
  python setup.py build
  python contrib/pull_locale
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/

  export PYTHONHASHSEED=0
  python setup.py install -O1 --root=${pkgdir}/

  mv ${pkgdir}/usr/share/pixmaps/electrum{,-mona}.png
  install -Dm644 LICENCE ${pkgdir}/usr/share/licenses/${pkgname}/LICENCE
}
