# Maintainer: Aleks Ozolins <aleks@ozolins.xyz>
pkgname=orgwarrior-web
pkgver=0.3.1
pkgrel=1
pkgdesc="Org mode's agenda in your browser, phone first: a web page over orgwarrior's engine"
arch=('any')
url="https://github.com/aleksozolins/orgwarrior-web"
license=('GPL-3.0-or-later')
depends=('python' "orgwarrior>=$pkgver")
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/o/orgwarrior-web/orgwarrior_web-$pkgver.tar.gz")
sha256sums=('05bcd81367a35ce2c2d5d6cecb7100703db14510c8a34c584588b86361d61efa')

build() {
  cd "orgwarrior_web-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "orgwarrior_web-$pkgver"
  # Routes and feed against a stub engine; the browser tests skip themselves.
  PYTHONPATH=src python -m pytest -q tests
}

package() {
  cd "orgwarrior_web-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  # The wheel brings orgwarrior's command too (for pipx); here the
  # orgwarrior package has it.
  rm "$pkgdir/usr/bin/orgwarrior"
}
