# Maintainer: Anton Kudelin <kudelin at proton dot me>

_pyname=pmdarima
pkgname=python-$_pyname
pkgver=2.0.3
pkgrel=1
pkgdesc="ARIMA estimators for Python"
arch=(x86_64 aarch64)
url="https://alkaline-ml.com/pmdarima"
license=(MIT)
depends=(python-scikit-learn python-statsmodels python-urllib3 cython)
optdepends=(python-matplotlib python-pytest)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::https://github.com/alkaline-ml/pmdarima/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('f386db23571ca4b3c16a4906613778ad46f8605746222152ca101a6efc316713')

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
  mv pmdarima/tests .
  rm -r pmdarima
  test-env/bin/python -m pytest -v
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=1 \
    dist/*.whl

  install -Dm755 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
