# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_pyname=clickclick
pkgname=python-clickclick
pkgver=20.10.2
pkgrel=6
arch=(any)
pkgdesc='Click command line utilities'
url='https://codeberg.org/hjacobs/python-clickclick'
license=(Apache)
depends=(python-click python-yaml)
makedepends=(python-setuptools python-build python-installer python-wheel flake8)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('d8954d231bff6945ac0e8350be05775a8a0b852dd0284e3446b3f9c8bc5861870ed1bc058e132c144fe8d543aee87d7a7a54894abdb4006664e5994c8cfb507f')

build() {
  cd "$srcdir/$pkgname"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

check() {
  cd "$srcdir/$pkgname"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  test-env/bin/python -m pytest -v -k 'not test_cli'
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl
}
