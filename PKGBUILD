# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=devito
pkgname=python-${_base}
pkgver=4.8.6
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
sha512sums=('7c59990352742d35d32dd65aa45e953940382fb1c78577840d9d4841739326f958af3192229a29808bcdf6435e15ea4b383bd9975a3857a6acd17c982b2dc15f')

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
