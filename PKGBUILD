# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=dolfinx
pkgname=python-fenics-${_base}
pkgdesc="Next generation FEniCS problem solving environment (python interface)"
pkgver=0.7.0.post0
pkgrel=1
arch=(x86_64)
url="https://github.com/FEniCS/${_base}"
license=(LGPL3)
depends=(dolfinx python-mpi4py)
makedepends=(python-build python-installer python-setuptools python-wheel pybind11 cmake)
checkdepends=(python-pytest python-cppimport python-scipy eigen python-matplotlib python-numba)
optdepends=('python-pyvista: for plotting'
  'python-numba: for jit support'
  'slepc: for eigenvalue solver support'
  'gmsh: for extract data from Gmsh models')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4727c3173ba8fb327608e73ae590c21966465d0703644af709648b4353713a27e114b8725ce6fe7eb87fedae39e19ef180847356263c2334680c3448c6088925')

build() {
  cd ${_base}-${pkgver}/python
  source /etc/profile.d/petsc.sh
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  if [ -z "$(ldconfig -p | grep libcuda.so.1)" ]; then
    export OMPI_MCA_opal_warn_on_missing_libcuda=0
  fi

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer ${_base}-${pkgver}/python/dist/*.whl
  test-env/bin/python -m pytest ${_base}-${pkgver}/python/test/unit -k 'not context_manager_anonymous'
  test-env/bin/python -m pytest ${_base}-${pkgver}/python/demo/test.py
}

package() {
  cd ${_base}-${pkgver}/python
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
