# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=python-elasticsearch-dsl
pkgver=7.2.0
pkgrel=2
pkgdesc='High-level Python client for Elasticsearch'
arch=(any)
url=https://elasticsearch-dsl.readthedocs.org
license=(Apache)
depends=(python python-elasticsearch python-dateparser)
makedepends=(python-setuptools python-sphinx python-sphinx_rtd_theme)
checkdepends=(python-mock python-pytest)
source=($pkgname-$pkgver.tar.gz::https://github.com/elastic/elasticsearch-dsl-py/archive/$pkgver.tar.gz)
sha512sums=('33e39f4ffb29e2638e301c376650dfde8267ff4ee3177d83bdad672b4c9cce53c99187d0d982d78074e4edeaf3240c49eba37c7d9e60fbcc99605403d9f45ec9')

build() {
  cd ${pkgname/python-/}-py-$pkgver
  python setup.py build

  cd docs
  # Include local build
  sed -i "15s/^/import sys\nsys.path.insert(0, os.path.join(os.path.dirname(__file__), '..\/build\/lib'))\n/" conf.py
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
