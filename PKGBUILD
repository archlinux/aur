# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
# Based on python-mpi4py, maintained by Bruno Pagani <archange@archlinux.org> and et.al.
_base=mpi4py
pkgname=python-${_base}-intel
pkgver=4.1.0
pkgrel=1
pkgdesc="Python bindings for the Message Passing Interface compiled with intel mpi"
arch=(x86_64)
url="https://github.com/${_base}/${_base}"
license=(BSD-2-Clause)
depends=(python intel-oneapi-basekit) # intel-oneapi-dpcpp-cpp
makedepends=(python-build python-installer python-setuptools python-wheel cython procps-ng)
# checkdepends=(python-pytest python-numba) # python-cupy
provides=(python-${_base})
conflicts=(python-${_base})
options=(!emptydirs)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('ec893f18d9ed6730fb5beb7201de33be075f1712ef370ef10fda5e57fed8d76c7b83a269c886b82b710d369200ce3fde77880b0f917a75c00ebbc2553d76b82a')

build() {
  cd ${_base}-${pkgver}
  source /opt/intel/oneapi/setvars.sh
  # /opt/intel/oneapi/compiler/2024.1.0/env/vars.sh
  # /opt/intel/oneapi/mpi/2021.12/env/vars.sh
  # https://community.intel.com/t5/Intel-oneAPI-HPC-Toolkit/MPI-linking-with-LLVM-based-compilers/m-p/1498230
  # CC=icx I_MPI_CC=icx MPICC="mpiicc -cc=icx" LDFLAGS="-shared-intel"
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   # This is required starting with OpenMPI 3.0 when trying to run more
#   # processes than the number of available cores
#   export OMPI_MCA_rmaps_base_oversubscribe=yes
#   # We don’t have CUDA by default
#   export OMPI_MCA_opal_warn_on_missing_libcuda=0

#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest -vv \
#     --ignore=test/test_cco_buf.py \
#     --ignore=test/test_cco_nb_buf.py \
#     --ignore=test/test_cco_nb_vec.py \
#     --ignore=test/test_cco_ngh_buf.py \
#     --ignore=test/test_cco_obj_inter.py \
#     --ignore=test/test_cco_vec.py \
#     --ignore=test/test_comm_inter.py \
#     --ignore=test/test_comm_inter.py \
#     --ignore=test/test_dynproc.py \
#     --ignore=test/test_io.py \
#     --ignore=test/test_msgspec.py \
#     --ignore=test/test_pack.py \
#     --ignore=test/test_p2p_buf.py \
#     --ignore=test/test_p2p_buf_matched.py \
#     --ignore=test/test_rma.py \
#     --ignore=test/test_rma_nb.py
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
