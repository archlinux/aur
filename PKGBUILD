# Maintainer: Anton Kudelin <kudelin at proton dot me>

_pyname=copulae
pkgname=python-$_pyname
pkgver=0.7.8
pkgrel=1
pkgdesc='Multivariate data modelling with Copulas in Python'
arch=(x86_64 aarch64)
url='https://copulae.readthedocs.io'
license=(MIT)
depends=(python-statsmodels python-scikit-learn python-wrapt)
makedepends=(python-setuptools cython python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::https://github.com/DanielBok/copulae/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('448305afa4382a949d5c2c6d94f4f63e1292bf26fe7d8159a38c022a7249dde6')

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
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-$_python_version" pytest -k 'not test_gmc'
}

package() {
  cd "$srcdir/$_pyname-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl

  install -Dm755 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
