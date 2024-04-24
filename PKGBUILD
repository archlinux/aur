# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=devito
pkgname=python-${_base}
pkgver=4.8.5
pkgrel=1
pkgdesc="Finite Difference DSL for symbolic computation"
arch=(any)
url="https://github.com/${_base}codes/${_base}"
license=(MIT)
depends=(python-cached-property python-psutil python-py-cpuinfo
  python-codepy python-multidict python-anytree python-sympy)
makedepends=(python-build python-installer python-setuptools python-wheel openmp)
# checkdepends=(python-pytest python-scipy python-matplotlib python-nbval python-cloudpickle)
optdepends=('python-mpi4py: for parallel support'
  'python-ipyparallel: for parallel support') # python-click
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('adc2fd7b6f3aa577b3287132e37f64e9997e2694fc62bf48d8f968ee1b46746cdcd75470e20ae9cc02ec235f12815a0fd1cde80c4ea22160e23529e5c018359a')

build() {
  cd ${_base}-${pkgver}
  DEVITO_ARCH=gcc DEVITO_MPI=1 python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   DEVITO_ARCH=gcc DEVITO_MPI=1 OMP_NUM_THREADS=1 \
#     test-env/bin/python -m pytest tests/test_mpi.py \
#     -k 'not partitioning and not partitioning_fewer_dims and not partitioning_fewer_dims_timefunc and not neighborhood_horizontal_2d and not neighborhood_diagonal_2d and not ctypes_neighborhood and not custom_topology and not halo_exchange_bilateral and not halo_exchange_bilateral_asymmetric[paddings0] and not halo_exchange_bilateral_asymmetric[paddings1]'
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
