# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=dolfinx
pkgname=python-fenics-${_base}
pkgdesc="Next generation FEniCS problem solving environment (python interface)"
pkgver=0.7.2
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
sha512sums=('268791b1891992f917d5d625825fa926feaf8663dc0571158891bbf11afbd8bdad3247c53aa2c79e9012be0e9a14acc0cf80beebe77a80a71b94315be97b9ffa')

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
  MPLBACKEND=Agg test-env/bin/python -m pytest ${_base}-${pkgver}/python/test/unit \
    -k 'not context_manager_anonymous and not nonmatching_mesh_interpolation and not nonmatching_mesh_single_cell_overlap_interpolation'
  MPLBACKEND=Agg test-env/bin/python -m pytest ${_base}-${pkgver}/python/demo/test.py
}

package() {
  cd ${_base}-${pkgver}/python
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
