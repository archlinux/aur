# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=devito
pkgname=python-${_base}
pkgver=4.8.7
pkgrel=1
pkgdesc="Finite Difference DSL for symbolic computation"
arch=(any)
url="https://github.com/${_base}codes/${_base}"
license=(MIT)
depends=(python-sympy python-cached-property python-psutil python-py-cpuinfo
  python-codepy python-multidict python-anytree python-cloudpickle python-click)
makedepends=(python-build python-installer python-setuptools python-wheel openmp git)
# checkdepends=(python-pytest python-scipy python-nbval python-matplotlib)
optdepends=('python-mpi4py: for parallel support'
  'python-ipyparallel: for parallel support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('03981d3bf98986c0732240e0605fdc1a8409af38b9a61131d1e8421978b267e5b520aa57aea1a6eb87e70b890769271a3a784ce4cd230289488f619eaf8243de')

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
