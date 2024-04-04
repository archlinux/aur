# Maintainer: Anton Kudelin <kudelin at proton dot me>

_pyname=copulae
pkgname=python-$_pyname
pkgver=0.7.9
pkgrel=1
pkgdesc='Multivariate data modelling with Copulas in Python'
arch=(x86_64 aarch64)
url='https://copulae.readthedocs.io'
license=(MIT)
depends=(python-statsmodels python-scikit-learn python-wrapt)
makedepends=(python-setuptools cython python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::https://github.com/DanielBok/copulae/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('369ed506bfc2aa29b36a1db3c8d6b4f3d1f217be002977ef83148ea0998c44d9')

build() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

check() {
  cd "$srcdir/$_pyname-$pkgver"
  mv setup.cfg setup.cfg.backup
  local _python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_python_version" pytest -k 'not test_gmc and not test_summary'
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl

  install -Dm755 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
