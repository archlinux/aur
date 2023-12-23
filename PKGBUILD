# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PhiML
pkgname=python-${_base,,}
pkgver=1.3.1
pkgrel=1
pkgdesc="Unified API for machine learning"
arch=(any)
url="https://github.com/tum-pbs/${_base}"
license=(MIT)
depends=(python-numpy python-scipy python-packaging)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-pytorch python-tensorflow python-jax)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('d6de8480e459e4f9b7984e8c87c6e925ac001bb0138cd86f89e8419f223d7327aa676900dae3ad82d367d9c90053b173b573451dda88fb0c6fba99af4a466209')

build() {
	cd ${_base}-${pkgver}
	python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
	cd ${_base}-${pkgver}
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer dist/*.whl
	test-env/bin/python -m pytest \
		--ignore=tests/commit/backend/test__backend.py \
		--ignore=tests/commit/math/test__functional.py \
		--ignore=tests/commit/math/test__ops.py \
		--ignore=tests/commit/math/test__optimize.py \
		--ignore=tests/commit/math/test__sparse.py \
		--ignore=tests/commit/math/test__tensors.py \
		--ignore=tests/gpu/test_tf_cuda_resample.py
}

package() {
	cd ${_base}-${pkgver}
	PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
