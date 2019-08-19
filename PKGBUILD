# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=python-geoip2
pkgver=2.9.0
pkgrel=3
pkgdesc='API for GeoIP2 web services and databases'
arch=(any)
url=https://geoip2.readthedocs.org/en/latest/
license=(Apache)
depends=('python-requests>=2.9'
         'python-maxminddb>=1.4.0')
makedepends=(git python-setuptools python-sphinx)
checkdepends=(python-requests-mock)
source=($pkgname-$pkgver.tar.gz::https://github.com/maxmind/GeoIP2-python/archive/v$pkgver.tar.gz
        git+https://github.com/maxmind/MaxMind-DB)
sha512sums=('8631a41d9644887d0149678e40a5f9d03bba660853c308c43bf358cd49b3f021566b9d6f65b670c0c1c78bcb4cb7cb007ad2db6f3c032749afa454fc9e06d74c'
            'SKIP')

build() {
  cd GeoIP2-python-$pkgver
  python setup.py build

  cd docs
  make man
}

check() {
  cd GeoIP2-python-$pkgver

  # Copy test data over
  mkdir tests/data/test-data
  cp "$srcdir"/MaxMind-DB/test-data/Geo{IP,Lite}2-* tests/data/test-data

  python -m unittest tests/*_test.py || warning "Tests failed"
}

package() {
  cd GeoIP2-python-$pkgver
  python setup.py install --root="$pkgdir" -O1
  install -Dm 644 docs/_build/man/geoip2.1 -t "$pkgdir"/usr/share/man/man1
  install -Dm 644 README.rst -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
