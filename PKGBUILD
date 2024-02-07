# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=rocket-fft
pkgname=python-${_base}
pkgdesc="Rocket-FFT extends Numba by scipy.fft and numpy.fft"
pkgver=0.2.4
pkgrel=1
arch=(any)
url="https://github.com/styfenschaer/${_base}"
license=('custom:BSD-3-clause')
depends=(python-numba)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-scipy)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('3141a0ef8584c83da19defebbed7ffa1419a888fc48d2569db04628557bfa1f89f7fb5d8d9e42604ac4462e6c9907862fdce0906383e3414204232e4acd48473')

build() {
  cd ${_base}-${pkgver}
  python setup.py build_ext --inplace
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --ignore=tests/test_numpy_like.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
