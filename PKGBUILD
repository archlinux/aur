# Maintainer:  Anton Kudelin <kudelin at proton dot me>

_pyname=prison
pkgname=python-$_pyname
pkgver=0.2.1
pkgrel=1
arch=(any)
pkgdesc='Python rison encoder/decoder'
url='https://github.com/betodealmeida/python-rison'
license=(MIT)
depends=(python-six)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/50/65/4456caa4e9bbd1d4d4b5eecaea41bb2cd31efe0e7e423c7a9ad8e2be75ea/$_pyname-$pkgver.tar.gz)
sha256sums=('e6cd724044afcb1a8a69340cad2f1e3151a5839fd3a8027fd1357571e797c599')

build() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

check() {
  cd "$srcdir/$_pyname-$pkgver"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  test-env/bin/python -m pytest -v
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m installer dist/*.whl \
    --destdir="$pkgdir" \
    --compile-bytecode=2

  install -Dm755 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
