# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=rocket-fft
pkgname=python-${_base}
pkgdesc="Rocket-FFT extends Numba by scipy.fft and numpy.fft"
pkgver=0.3.1
pkgrel=1
arch=(any)
url="https://github.com/styfenschaer/${_base}"
license=(BSD-3-Clause)
depends=(python-numba)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-scipy)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('560c393e71b17102c20dd22d481299628e97e85429dd51db16515be26d3d4eb4aec30b67f837c7b85b0419effc3816acdfe521e205fccf6f6198ce4d94523bb2')

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
