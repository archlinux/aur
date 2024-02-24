# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PhiML
pkgname=python-${_base,,}
pkgver=1.4.0
pkgrel=1
pkgdesc="Unified API for machine learning"
arch=(any)
url="https://github.com/tum-pbs/${_base}"
license=(MIT)
depends=(python-numpy python-scipy python-packaging)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-pytorch python-tensorflow python-jax)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('02c2966c73d8b5e0ec95a561d6efd74730f9eda59312aab7f2de6369d54ac960d59d80d4b5f233cf3c7110e0e8dddac3313700bc653d4ed19e25332b0c17cdcc')

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
