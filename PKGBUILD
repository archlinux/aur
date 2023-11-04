# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
# Based on python-mpi4py, maintained by Bruno Pagani <archange@archlinux.org> and et.al.
_base=mpi4py
pkgname=python-${_base}-intel
pkgver=3.1.5
pkgrel=1
pkgdesc="Python bindings for the Message Passing Interface compiled with intel mpi"
arch=(x86_64)
url="https://github.com/${_base}/${_base}"
license=('custom:BSD-2-clause')
depends=(python intel-oneapi-basekit) # intel-oneapi-dpcpp-cpp
makedepends=(python-build python-installer python-setuptools python-wheel cython0)
checkdepends=(python-pytest python-numba) # python-cupy
provides=(python-${_base})
conflicts=(python-${_base})
options=(!emptydirs)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('705f1e88952e78612284c70fd1b11abacd524aeb25a5d8db22f5d94b35446eea9f60d6078619bc12b20dc85dd944ea8b8b5d4b2faeeda7219d2271c685c07df1')

build() {
  cd ${_base}-${pkgver}
  source /opt/intel/oneapi/setvars.sh
  # /opt/intel/oneapi/compiler/2023.2.0/env/vars.sh
  # /opt/intel/oneapi/mpi/2021.10.0/env/vars.sh
  # https://community.intel.com/t5/Intel-oneAPI-HPC-Toolkit/MPI-linking-with-LLVM-based-compilers/m-p/1498230
  # CC=icx I_MPI_CC=icx MPICC="mpiicc -cc=icx" LDFLAGS="-shared-intel"
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  if [ -z "$(ldconfig -p | grep libcuda.so.1)" ]; then
    # We don’t have CUDA by default
    export OMPI_MCA_opal_warn_on_missing_libcuda=0
  fi

  # This is required starting with OpenMPI 3.0 when trying to run more
  # processes than the number of available cores
  export OMPI_MCA_rmaps_base_oversubscribe=yes

  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -vv \
    --ignore=test/test_cco_buf.py \
    --ignore=test/test_cco_nb_buf.py \
    --ignore=test/test_cco_nb_vec.py \
    --ignore=test/test_cco_ngh_buf.py \
    --ignore=test/test_cco_obj_inter.py \
    --ignore=test/test_cco_vec.py \
    --ignore=test/test_comm_inter.py \
    --ignore=test/test_comm_inter.py \
    --ignore=test/test_dynproc.py \
    --ignore=test/test_io.py \
    --ignore=test/test_msgspec.py \
    --ignore=test/test_pack.py \
    --ignore=test/test_p2p_buf.py \
    --ignore=test/test_p2p_buf_matched.py \
    --ignore=test/test_rma.py \
    --ignore=test/test_rma_nb.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
