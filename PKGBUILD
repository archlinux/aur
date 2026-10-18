# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=rocket-fft
pkgname=python-${_base}
pkgdesc="Rocket-FFT extends Numba by scipy.fft and numpy.fft"
pkgver=0.4.1
pkgrel=1
arch=(any)
url="https://github.com/styfenschaer/${_base}"
license=(BSD-3-Clause)
depends=(python-numba)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-scipy)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('87737ea5e6654f4b7c049a9e669a9528867635dca47ed4801e9efe1bad1d4350af3d95161eb0a9cb62d3f2190d7694a46edc444ed8133828c6c21a08f120c644')

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
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
