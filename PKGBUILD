# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=python-elasticsearch-dsl
pkgver=7.0.0
pkgrel=1
pkgdesc='High-level Python client for Elasticsearch'
arch=(any)
url=https://elasticsearch-dsl.readthedocs.org
license=(Apache)
depends=(python python-elasticsearch python-dateparser)
makedepends=(python-setuptools python-sphinx python-sphinx_rtd_theme)
checkdepends=(python-mock python-pytest)
source=($pkgname-$pkgver.tar.gz::https://github.com/elastic/elasticsearch-dsl-py/archive/$pkgver.tar.gz)
sha512sums=('181b2706e145ab66e7d0362f09598997126fa5480f98e9991f48b1c6aa35fa6a3edbf7028a14e81bc1a678eee25257975bc1e197b06a4a1b8712a3fd6d8ca130')

build() {
  cd ${pkgname/python-/}-py-$pkgver
  python setup.py build

  cd docs
  # Include local build
  sed -i "15s/^/sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..\/build\/lib'))\n/" conf.py
  make man
}

check() {
  cd ${pkgname/python-/}-py-$pkgver
  python test_elasticsearch_dsl/run_tests.py || warning "Tests failed"
}

package() {
  cd ${pkgname/python-/}-py-$pkgver
  python setup.py install --root="$pkgdir" -O1
  install -Dm 644 docs/_build/man/elasticsearch-dsl.1 -t "$pkgdir"/usr/share/man/man1
  install -Dm 644 README.rst -t "$pkgdir"/usr/share/doc/$pkgname
  cp -a examples "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
