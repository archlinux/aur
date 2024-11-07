# Maintainer: Anton Kudelin <kudelin at proton dot me>

_pyname=pmdarima
pkgname=python-$_pyname
pkgver=2.0.4
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
sha256sums=('83eca810992679f2086781a8b58b39558392380c13ac60819b026fffb105cfcd')

prepare() {
  cat <<EOF > "$srcdir/$_pyname-$pkgver/$_pyname/VERSION"
$pkgver
EOF
}

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
  mv $_pyname/tests .
  rm -r $_pyname
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
