# Maintainer: Jean Lucas <jean@4ray.co>
# Contributor: Doron Behar <doron.behar@gmail.com>

pkgname=python-maxminddb
pkgver=1.4.1
pkgrel=3
pkgdesc='Module for reading MaxMind DB files'
arch=(any)
url=https://maxminddb.readthedocs.io
license=(BSD)
depends=(python libmaxminddb)
makedepends=(git python-setuptools)
checkdepends=(python-sphinx python-mock)
source=($pkgname-$pkgver.tar.gz::https://github.com/maxmind/MaxMind-DB-Reader-python/archive/v$pkgver.tar.gz
        git+https://github.com/maxmind/MaxMind-DB)
sha512sums=('94bee89a0ef9d24f937f12f79dc8b9686be46ba3aeedc5538cc0c2ff4379ad2eb0bb84914849d3baa9120d4bbdb3abc215e30efd237a2c6d5fc0161e7e40c0d6'
            'SKIP')

build() {
  cd MaxMind-DB-Reader-python-$pkgver
  python setup.py build

  cd docs
  make man
}

check() {
  cd MaxMind-DB-Reader-python-$pkgver

  # Copy test data over
  mkdir tests/data/test-data
  cp "$srcdir"/MaxMind-DB/test-data/{GeoIP2-*,MaxMind-*,maps-*} tests/data/test-data

  python -m unittest discover tests *_test.py || warning "Tests failed"
}

package() {
  cd MaxMind-DB-Reader-python-$pkgver
  python setup.py install --root="$pkgdir" -O1
  install -Dm 644 docs/_build/man/maxminddb.1 -t "$pkgdir"/usr/share/man/man1
  install -Dm 644 README.rst -t "$pkgdir"/usr/share/doc/$pkgname
  cp -a examples "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
