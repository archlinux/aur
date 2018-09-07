# Maintainer: Musee "lae" Ullah <lae(at)lae(dot)is>
pkgname=electrum-mona
pkgver=3.1.3.1
pkgrel=2
pkgdesc="A lightweight Monacoin wallet"
arch=('any')
url='https://github.com/wakiyamap/electrum-mona'
license=('MIT')
depends=('cython'
         'python-pyaes'
         'python-ecdsa'
         'python-pbkdf2'
         'python-requests'
         'python-qrcode'
         'python-lyra2re_hash'
         'python-protobuf'
         'python-dnspython'
         'python-jsonrpclib-pelix'
         'python-pysocks'
         'python-pyqt5'
         'python-certifi'
         'python-pycryptodomex'
         'python-websocket-client'
         'gettext'
)
optdepends=('python-matplotlib: for plot history'
            'python-trezor: for Trezor hardware support'
            'python-btchip: for BTChip hardware support'
            'python-keepkey: for KeepKey hardware support')
makedepends=('python-pycurl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wakiyamap/${pkgname}/archive/${pkgver}.tar.gz"
        "0001-locale-download.patch")
sha512sums=('7ce49fb53cebd4c168bcce1003b38ecc7ed4024419144a43b38cfe60ac20521cd6271e83afb4ec8d823a477b8bffa75d429ca5dfe93f549a927666478d73e2a5'
            '434e2695ccc41519d86a4c89b56be9f60bfaf072ceb70344d9ca43954521e58904d01401e65f04ab24a1c05d5511996187cdef83f8b4b8bc09b70c7c8d1086eb')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  pyrcc5 icons.qrc -o gui/qt/icons_rc.py
  patch -Np1 -i "${srcdir}/0001-locale-download.patch"
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  ./setup.py build
  ./contrib/make_locale
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}/

  ./setup.py install -O1 --root=${pkgdir}/

  mv ${pkgdir}/usr/share/pixmaps/electrum{,-mona}.png
  install -Dm644 electrum-mona.conf.sample ${pkgdir}/usr/share/doc/electrum-mona/examples/electrum-mona.conf
  install -Dm644 LICENCE ${pkgdir}/usr/share/licenses/${pkgname}/LICENCE
}
