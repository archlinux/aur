# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=devito
pkgname=python-${_base}
pkgver=4.8.11
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
sha512sums=('a3d7a659e8ada4f57eff3e2bc46b931dbdc91b9aa13827cb150a2b7472dce3ae920d97b8dec1287f28fe4f1237ab9754f337ff200fc3982966380bb00cdd9409')

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
