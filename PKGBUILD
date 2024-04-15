# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PhiML
pkgname=python-${_base,,}
pkgver=1.5.1
pkgrel=1
pkgdesc="Unified API for machine learning"
arch=(any)
url="https://github.com/tum-pbs/${_base}"
license=(MIT)
depends=(python-numpy python-scipy python-packaging)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-pytorch python-tensorflow python-jax)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('13f8b80bdd3136534615bc8ddd2f8a26ba8bc8ece5fe9ccf478e3e958d5b8f6ae3d2eb246dff28f4d0f0e96c2cf500fd6b68149e1eba01ff18ed4e02b0364215')

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
