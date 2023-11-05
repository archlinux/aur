# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=termplotlib
pkgname=python-${_base}
pkgver=0.3.9
pkgrel=3
pkgdesc="Plotting on the command line"
arch=(any)
url="https://github.com/nschloe/${_base}"
license=(GPL)
depends=(python-numpy gnuplot)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-codeblocks)
source=(https://files.pythonhosted.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
b2sums=('651b5951636d4279a2a1f55d478b5c5a2c4a11f373ce36bb1549fadc8290ec1870a249c48e92c393b2108a74de5a93eeb708e9a214fa6858659f6c4258b8aa4b')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --codeblocks --ignore=tests/test_plot.py -k 'not README'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
}
