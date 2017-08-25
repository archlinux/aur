# Maintainer: Musee "lae" Ullah <lae(at)lae(dot)is>
pkgname=electrum-mona
pkgver=2.9.3.3
pkgrel=2
pkgdesc="A lightweight Monacoin wallet"
arch=('any')
url='https://github.com/wakiyamap/electrum-mona'
license=('MIT')
depends=('python2-pyaes'
         'python2-ecdsa'
         'python2-pbkdf2'
         'python2-requests'
         'python2-qrcode'
         'python2-lyra2re_hash'
         'python2-protobuf'
         'python2-dnspython'
         'python2-jsonrpclib'
         'python2-pysocks'
         'python2-pyqt4'
         'python2-certifi'
         'gettext'
)
optdepends=('python2-matplotlib: for plot history')
makedepends=('python2-pycurl')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wakiyamap/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('15fab04ed45e81b9441fcf33d5b28c062683a6e0a4eb2a69ef7c2a35b975001250859a69134cde016f35503096e8a002b101821b2d3bf481e60dadeeec657892')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}/
  # Ensure everything uses Python 2
  find ./ -type f -exec sed -i '/#!/s/python$/&2/' {} +
  pyrcc4 icons.qrc -o gui/qt/icons_rc.py
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
