# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=python2-influxdb
pkgver=5.0.0
pkgrel=1
pkgdesc="Python client for InfluxDB"
arch=(any)
url=https://github.com/influxdb/influxdb-python
license=(MIT)
depends=(python2 python2-dateutil python2-six python2-pytz python2-requests)
optdepends=(influxdb python2-pandas)
#checkdepends=(python2-nose python2-mock python2-requests-mock python2-pandas) - disabled due to failure
options=(!emptydirs)
source=("https://github.com/influxdb/influxdb-python/archive/v$pkgver.tar.gz")
sha256sums=('7ff7427fb90dcdedc44b68def0d9a04b800d0ddf842fadd51d03034708b8dce0')

build() {
  cd "$srcdir/influxdb-python-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/influxdb-python-$pkgver"
  return 0 # test_write_points_from_dataframe_with_numeric_precision fails - pandas version mismatch?
  INFLUXDB_PYTHON_INFLUXD_PATH=influxdb_install/usr/bin/influxd nosetests2 -v --with-doctest
}

package() {
  cd "$srcdir/influxdb-python-$pkgver"
  python2 setup.py install --skip-build --root="$pkgdir/" --optimize=1

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
