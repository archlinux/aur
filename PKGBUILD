# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=devito
pkgname=python-${_base}
pkgver=4.8.22
pkgrel=1
pkgdesc="Finite Difference DSL for symbolic computation"
arch=(any)
url="https://github.com/${_base}codes/${_base}"
license=(MIT)
depends=(python-sympy python-psutil python-py-cpuinfo python-codepy 
  python-multidict python-anytree python-cloudpickle python-packaging)
makedepends=(python-build python-installer python-setuptools python-wheel openmp)
# checkdepends=(python-pytest python-scipy python-nbval python-matplotlib python-mpi4py)
optdepends=('python-mpi4py: for parallel support'
  'python-ipyparallel: for parallel support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('29f4c9ba8a27d970ee271c7497203a754a2f9f8386f9e966b52d936d07243c2204af1c9b982b8560a5d75ec2a0cbf7698e83a2f5ddc32c894933dfdee0f874b6')

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
