# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=rocket-fft
pkgname=python-${_base}
pkgdesc="Rocket-FFT extends Numba by scipy.fft and numpy.fft"
pkgver=0.2.5
pkgrel=1
arch=(any)
url="https://github.com/styfenschaer/${_base}"
license=(BSD-3-Clause)
depends=(python-numba)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-scipy)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f19fc6ee45f6a2f52c8daade17508a7f0627c6d8e8d272791d4041bf9916d93bbdf88ee45f0c30943ef9982bcf035d088ecce5ee61f2d8cf2338710266b5a46e')

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
