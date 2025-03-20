# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=devito
pkgname=python-${_base}
pkgver=4.8.14
pkgrel=1
pkgdesc="Finite Difference DSL for symbolic computation"
arch=(any)
url="https://github.com/${_base}codes/${_base}"
license=(MIT)
depends=(python-sympy python-psutil python-py-cpuinfo python-codepy python-click
  python-multidict python-anytree python-cloudpickle)
makedepends=(python-build python-installer python-setuptools python-wheel openmp)
# checkdepends=(python-pytest python-scipy python-nbval python-matplotlib python-mpi4py)
optdepends=('python-mpi4py: for parallel support'
  'python-ipyparallel: for parallel support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('1cef7358b5994b284373b2924a967e0c9bdbdcbf10856d2424af423f4aacfbe8bb7912285c2a9c4c96f9ad73b322f1749c306a90d4de1f590ab5300aaf348738')

build() {
  cd ${_base}-${pkgver}
  DEVITO_ARCH=gcc DEVITO_MPI=1 python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   DEVITO_ARCH=gcc DEVITO_MPI=1 OMP_NUM_THREADS=1 \
#     test-env/bin/python -m pytest tests/test_mpi.py
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
