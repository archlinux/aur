# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=rocket-fft
pkgname=python-${_base}
pkgdesc="Rocket-FFT extends Numba by scipy.fft and numpy.fft"
pkgver=0.2.1
pkgrel=1
arch=(any)
url="https://github.com/styfenschaer/${_base}"
license=('custom:BSD-3-clause')
depends=(python-numba)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b81b7079b69cbb3b0dd2a433c4ec7178353f8301acdcde9a0c04853010a0e03e7c49b343b25beb76cfbfb8b7efeefbad794a397c08089231ee1609dcc25a4903')

build() {
  cd ${_base}-${pkgver}
  python setup.py build_ext --inplace
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k 'not numpy_like_dtypes and not numpy_like_axes'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
