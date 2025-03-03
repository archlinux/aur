# Maintainer: Anton Kudelin <kudelin at proton dot me>

_pyname=copulae
pkgname=python-$_pyname
pkgver=0.8.0
pkgrel=1
pkgdesc='Multivariate data modelling with Copulas in Python'
arch=(x86_64 aarch64)
url='https://copulae.readthedocs.io'
license=(MIT)
depends=(python-statsmodels python-scikit-learn python-wrapt)
makedepends=(python-setuptools cython python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::https://github.com/DanielBok/copulae/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('855588da9f6142331ec62f8ce2d99058178000802e42884e830743f4e34bf1a2')

build() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

check() {
  cd "$srcdir/$_pyname-$pkgver"
  sed -i '/--cov/d' pyproject.toml

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  mv $_pyname $_pyname-orig

  test-env/bin/python -m pytest -v ./tests
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl

  install -Dm755 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
