# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python-scielo-clea')
pkgver=0.4.5
pkgrel=1
pkgdesc="SciELO Publishing Schema XML document front matter metadata reader/sanitizer"
arch=('any')
url='https://github.com/scieloorg/clea'
license=('BSD')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'flake8')
depends=('python-lxml' 'python-numpy' 'python-levenshtein'
         'python-ujson' 'python-click'
         'python-regex' 'python-unidecode')
optdepends=('python-flask: development web server'
            'gunicorn: web server alternative')
options=(!emptydirs)
sha256sums=('fd270f013fa3c2227bc7834bc904b9ac683c89fc2d883e4314d0f3b635dafa63'
            'SKIP')
source=("clea-v$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "Vkbh7CKQDNQzX7bW3cQVdJx.json")

prepare() {
  cd "$srcdir/clea-$pkgver"

  # Fix incomplete test file (add the missing expected result file)
  ln -srf ../Vkbh7CKQDNQzX7bW3cQVdJx.json tests/json/

  # Avoid python-pytest-flake8 while it isn't compatible with flake8
  sed -i /-flake/d tox.ini
}

check() {
  cd "$srcdir/clea-$pkgver"
  python -m pytest
  flake8 --ignore E501
}

package() {
  cd "$srcdir/clea-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
