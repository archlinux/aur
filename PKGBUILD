# Maintainer:  Anton Kudelin <kudelin at proton dot me>

_pyname=xarray-einstats
pkgname=python-$_pyname
pkgver=0.5.1
pkgrel=1
pkgdesc='Stats, linear algebra and einops for xarray'
arch=(any)
url='https://einstats.python.arviz.org'
license=(Apache)
depends=(python-scipy python-xarray)
makedepends=(python-poetry python-build python-installer python-flit-core)
optdepends=(python-dask python-numba python-einops)
checkdepends=(python-pytest)
source=($pkgname-$pkgver.tar.gz::https://github.com/arviz-devs/$_pyname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('9ad9791455e9fe8270cf041aedb03906c2e3e4f721545c708041ff3e2ddb3b28')

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
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=1 \
    dist/*.whl
}
