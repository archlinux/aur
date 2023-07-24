# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=mystic
pkgname=python-${_base}
pkgdesc="highly-constrained non-convex optimization and uncertainty quantification"
pkgver=0.4.1
pkgrel=1
url="https://github.com/uqfoundation/${_base}"
arch=(any)
license=('custom:BSD-3-clause')
depends=(python-numpy python-sympy python-klepto)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
optdepends=('python-scipy: for SciPy optimization'
  'python-pathos: for for parallel computing'
  'python-pyina: for for parallel computing'
  'python-matplotlib: for Matplotlib rendering')
source=(${_base}-${_base}-${pkgver}.tar.gz::${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('c8fdc2386815e5c046d23f3aefd6e97a4b04a826f2cbeff631e8716eca305918aa1c0640f6612ca13532ef98a58e107f8e554d225eb36d0deed180f7509c75aa')

build() {
  cd ${_base}-${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest ${_base}/tests \
    --ignore=${_base}/tests/test_collapse.py \
    --ignore=${_base}/tests/test_collapsed.py \
    --ignore=${_base}/tests/test_1d2d_expect.py \
    --ignore=${_base}/tests/test_boundsconstrained.py \
    --ignore=${_base}/tests/test_solver_compare.py \
    --ignore=${_base}/tests/test_solver_constraints.py \
    --ignore=${_base}/tests/test_solver_sanity.py \
    --ignore=${_base}/tests/test_solver_suite.py \
    --ignore=${_base}/tests/test_symbolic_basic.py \
    --ignore=${_base}/tests/test_termination.py \
    --ignore=${_base}/tests/test_vectorize.py
}

package() {
  cd ${_base}-${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
