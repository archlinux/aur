# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-scielo-clea')
pkgver=0.4.3
pkgrel=1
pkgdesc="SciELO Publishing Schema XML document front matter metadata reader/sanitizer"
arch=('any')
url='https://github.com/scieloorg/clea'
license=('BSD')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-flake8')
depends=('python-lxml' 'python-numpy' 'python-levenshtein'
         'python-ujson' 'python-click'
         'python-regex' 'python-unidecode')
optdepends=('python-flask: development web server'
            'gunicorn: web server alternative')
options=(!emptydirs)
sha256sums=('bc51f96084970188c7f8229a7ede5c863dc20651cb3583b722fc7f8487af5d9f'
            'SKIP')
source=("clea-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "Vkbh7CKQDNQzX7bW3cQVdJx.json")

prepare() {
  cd "$srcdir/clea-$pkgver"

  # Fix release number in package
  sed -i s/0.4.2/0.4.3/ clea/__init__.py

  # Fix invalid test
  sed -i 's/,"article_title/,"id_without_specified_use":\["12345"\]&/' \
    tests/json/broken_article.json

  # Fix incomplete test file (add the missing expected result file)
  ln -srf ../Vkbh7CKQDNQzX7bW3cQVdJx.json tests/json/
}

check() {
  cd "$srcdir/clea-$pkgver"
  python -m pytest
}

package() {
  cd "$srcdir/clea-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
