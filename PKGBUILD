# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=dolfinx
pkgname=python-fenics-${_base}
pkgdesc="Next generation FEniCS problem solving environment (python interface)"
pkgver=0.10.0.post3
pkgrel=1
arch=(x86_64)
url="https://github.com/FEniCS/${_base}"
license=(LGPL-3.0-or-later GPL-3.0-or-later)
depends=(dolfinx python-mpi4py)
makedepends=(python-build python-installer python-scikit-build-core python-wheel nanobind)
checkdepends=(python-pytest python-sympy python-scipy python-matplotlib python-numba)
optdepends=('python-pyvista: for plotting'
  'python-numba: for jit support'
  'slepc: for eigenvalue solver support'
  'gmsh: for extract data from Gmsh models')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4afaf283214336d897afb35a187dce01cdf2c6b5026d123946fa71dfdaab3472119f1a165668d924eeb24a12b2a6e1d1922d27d737791842adbb870948a16aff')

build() {
  cd ${_base}-${pkgver}/python
  source /etc/profile.d/petsc.sh
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer python/dist/*.whl
  MPLBACKEND=Agg test-env/bin/python -m pytest python/test/unit \
    -k 'not mixed_topology_partitioning and not custom_mesh_loop_rank1[complex64] and not custom_mesh_loop_rank1[complex128] and not read_write_p2_mesh[Encoding.HDF5] and not read_write_p2_mesh[Encoding.ASCII]' \
    --ignore=python/test/unit/mesh/test_higher_order_mesh.py \
    --ignore=python/test/unit/io/test_xdmf_function.py \
    --ignore=python/test/unit/io/test_adios2.py
  MPLBACKEND=Agg test-env/bin/python -m pytest python/demo/test.py \
  -k 'not demos[path5-demo_gmsh.py] and not demos[path13-demo_pml.py] and not demos[path18-demo_scattering_boundary_conditions.py] and not demos[path19-demo_static-condensation.py] and not demos_mpi[path5-demo_gmsh.py] and not demos_mpi[path13-demo_pml.py] and not demos_mpi[path18-demo_scattering_boundary_conditions.py] and not demos_mpi[path19-demo_static-condensation.py]'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" python/dist/*.whl
  install -Dm 644 COPYING* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
