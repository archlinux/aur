# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python38-eventlet
_pyname=eventlet
pkgver=0.33.1
pkgrel=1
pkgdesc='Highly concurrent networking library'
url='https://eventlet.net'
arch=('any')
license=('MIT')
depends=('python' 'python38-greenlet' 'python38-monotonic' 'python38-dnspython')
makedepends=('python38-setuptools' 'python38-sphinx')
checkdepends=('python38-psycopg2' 'python38-nose' 'python38-pyopenssl' 'python38-httplib2' 'python38-mock' 'python38-pyzmq')
optdepends=(
  'python38-psycopg2: non-blocking PostgreSQL support'
  'python38-pyopenssl: non-blocking SSL support'
  'python38-httplib2: non-blocking HTTP support'
  'python38-pyzmq: non-blocking ZeroMQ support'
  'python38-dnspython: non-blocking DNS support'
)
options=('!makeflags')
source=(https://github.com/eventlet/eventlet/archive/v${pkgver}/${_pyname}-${pkgver}.tar.gz)
sha512sums=('437deffb2e24a3361585a5861d35bc19131d80ffd54fb8172e232683286fc0f28e68fd1a89f7ebe5067a5b9699b6c3382c9be5868adc2ebb11c2d205b644093c'
            '07739075628ff9d140064e04189332b479f184e4647753f987b0818fa55aaca907d4880afb5cf31f980426f315e1014027dcd848551149000a12145f982cd883')
b2sums=('d8581d41783cd31996b9c842da47d94d8bde5939dcbfabf9b1c70b58670fcbcf499a7e5408b0842df951202a63be5eaed27afeeccfc9e4237548330bfc49f4bd'
        '783445f708c12586e026f7feac982a7b6c21f86468609c375568b51ad6055977df3d0bc740f3127b9f8bc95c1c50e81aae02ca0e0be674ed4627910d39b1ef47')

prepare() {
  cd ${_pyname}-${pkgver}
  # https://github.com/eventlet/eventlet/issues/730
  # https://github.com/eventlet/eventlet/issues/739
  #patch -Np1 -i ../python3.10.patch
  sed -r 's|(check_idle_cpu_usage\(.*,) .*\)|\1 0.8\)|g' -i tests/*_test.py
}

build() {
  cd ${_pyname}-${pkgver}
  python3.8 setup.py build
  make -C doc text
}

check() {
  cd ${_pyname}-${pkgver}
  nosetests -sv tests
}

package() {
  cd ${_pyname}-${pkgver}
  python3.8 setup.py install --prefix=/usr --root="${pkgdir}" -O1
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r doc/_build/text "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r examples "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
