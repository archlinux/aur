# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: eDgar <eDgar [at/at] openmail.cc>
# Contributor: Sigvald Marholm <marholm@marebakken.com>
# Contributor: Georg S. Voelker <voelker@maibox.org>
# Based on dolfin-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com> and submitted by myles

_base=dolfin
pkgname=python-${_base}
pkgdesc="The Python interface of FEniCS"
pkgver=2019.1.0.post0
pkgrel=2
arch=('x86_64')
url="https://bitbucket.org/fenics-project/${_base}"
license=('LGPL3')
depends=('dolfin=2019.1.0.post0'
  'python-pkgconfig'
  'python-ply'
  'python-mpi4py')
makedepends=('cmake')
checkdepends=('openssh' 'python-pytest' 'python-decorator')
optdepends=('petsc: interface with PETSc from python'
  'slepc: interface with SLEPc from python'
  'python-matplotlib: plotting support')
options=(!emptydirs)
source=(${_base}-${pkgver}.tar.gz::${url}/downloads/${_base}-${pkgver}.tar.gz)
sha512sums=('0677245d2537d6e3b25bc8c47700a4d10690f35a49a544456456601505703e0b21ddec510f456146edef3d0beea366092a54a23ac29bd165c9c97cede6d6ca10')

build() {
  [ -n "$PETSC_DIR" ] && source /etc/profile.d/petsc.sh
  [ -n "$SLEPC_DIR" ] && source /etc/profile.d/slepc.sh

  cd ${_base}-${pkgver}/python
  python setup.py build
}

check() {
  if [ -z "$(ldconfig -p | grep libcuda.so.1)" ]; then
    export OMPI_MCA_opal_warn_on_missing_libcuda=0
  fi
  export OMPI_MCA_rmaps_base_oversubscribe=1
  export OMPI_MCA_mpi_yield_when_idle=1
  export OMPI_MCA_btl_base_warn_component_unused=0
  pushd ${_base}-${pkgver}/python
  python setup.py install --root="${srcdir}/tmp_install" --optimize=1 --skip-build
  popd
  PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" mpirun -n 3 python -m pytest ${_base}-${pkgver}/python/test/unit -k 'not coordinate_derivative and not dofmap and not finite_element and not test_form and not local_assembler and not function and not vector and not parameters and not local_solver_dg[shared_facet] and not solve_local[shared_facet] and not elliptic_eqn_on_intersecting_surface and not bcs and not incremental_assembly[mesh_factory0] and not incremental_assembly[mesh_factory1] and not lu_solver[PETSc] and not layout_and_pattern_interface[PETSc-element0] and not layout_and_pattern_interface[PETSc-element1] and not layout_and_pattern_interface[PETSc-element2] and not layout_and_pattern_interface[PETSc-element3] and not shared_entities[shared_vertex-mesh_factory8] and not snes_solver[5-PETSc] and not newton_solver[5-PETSc] and not computed_norms_against_references and not lu_solver_reuse[PETSc] and not matrix' --ignore=${_base}-${pkgver}/python/test/unit/la/test_vector.py --ignore=${_base}-${pkgver}/python/test/unit/function/test_function_space.py
}

package() {
  cd ${_base}-${pkgver}/python
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
