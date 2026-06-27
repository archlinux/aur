# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

_pkgname=pyexcel-xlsx
pkgname=python-$_pkgname
pkgver=0.6.1
pkgrel=1
pkgdesc='A wrapper library to read, manipulate and write data in xlsx and xlsm format using openpyxl'
url="https://github.com/pyexcel/$_pkgname"
arch=(any)
license=(BSD-3-Clause)
depends=(python-openpyxl python-pyexcel-io)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-nose python-pyexcel python-pyexcel-xls python-xlrd)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('e0fa99c06cf143af7e8e8ebe67bf44308968c3c8832d65de223f82a1f03a1505')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m venv --system-site-packages testenv
  testenv/bin/python -m installer dist/*.whl
  testenv/bin/python -m nose tests
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
