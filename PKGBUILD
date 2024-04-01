# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PhiML
pkgname=python-${_base,,}
pkgver=1.5.0
pkgrel=1
pkgdesc="Unified API for machine learning"
arch=(any)
url="https://github.com/tum-pbs/${_base}"
license=(MIT)
depends=(python-numpy python-scipy python-packaging)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-pytorch python-tensorflow python-jax)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('6fc7b0cef6c65f68779a71cf7b00ac65268ca7690c9e64c1383ab7f2ef461cb312194d00be47c0ce9c06c00a7e6929891270f6ad6ce267720f483b5b5174954d')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    -k 'not csr_slice_concat' \
    --ignore=tests/commit/backend/test__backend.py \
    --ignore=tests/commit/math/test__functional.py \
    --ignore=tests/commit/math/test__ops.py \
    --ignore=tests/commit/math/test__optimize.py \
    --ignore=tests/commit/math/test__tensors.py \
    --ignore=tests/gpu/test_tf_cuda_resample.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
