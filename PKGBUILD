# Maintainer: Aleks Ozolins <aleks@ozolins.xyz>
pkgname=orgwarrior-web
pkgver=0.1.0
pkgrel=1
pkgdesc="Org mode's agenda in your browser, phone first: a web page over orgwarrior's engine"
arch=('any')
url="https://github.com/aleksozolins/orgwarrior-web"
license=('GPL-3.0-or-later')
depends=('python' "orgwarrior>=$pkgver")
makedepends=('python-build' 'python-installer' 'python-hatchling')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/o/orgwarrior-web/orgwarrior_web-$pkgver.tar.gz")
sha256sums=('4b7eeb7f4466ad6e4b9d63b6ed8aebac26ba391339e5c1949ef1bb7ade09c0a2')

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
