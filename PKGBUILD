# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
# Based on python-mpi4py, maintained by Bruno Pagani <archange@archlinux.org> and et.al.
_base=mpi4py
pkgname=python-${_base}-intel
pkgver=3.1.4
pkgrel=1
pkgdesc="Python bindings for the Message Passing Interface compiled with intel mpi"
arch=(x86_64)
url="https://github.com/${_base}/${_base}"
license=('custom:BSD-2-clause')
depends=(python intel-oneapi-compiler) # "intel-oneapi-mpi=2023.0.0"
makedepends=(python-setuptools cython)
provides=(python-${_base})
conflicts=(python-${_base})
options=(!emptydirs)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('074ac690c7606e104b6f7a82c03eb99906f6efe2556c0ecba14a8949a3f9b263d7a75b7f714c37c83ac971fbee3e60bd0bbb3110b37ee9bd9a6fdc5041d78095')

build() {
  cd ${_base}-${pkgver}
  source /opt/intel/oneapi/setvars.sh                    # intel-oneapi-common
  source /opt/intel/oneapi/compiler/2023.0.0/env/vars.sh # intel-oneapi-compiler
  # https://aur.archlinux.org/packages/intel-oneapi-compiler#comment-856804
  CC=icx MPICC=mpiicc LDFLAGS="-shared-intel" python setup.py build
}

# check() {
#   if [ -z "$(ldconfig -p | grep libcuda.so.1)" ]; then
#     # We don’t have CUDA by default
#     export OMPI_MCA_opal_warn_on_missing_libcuda=0
#   fi

#   # This is required starting with OpenMPI 3.0 when trying to run more
#   # processes than the number of available cores
#   export OMPI_MCA_rmaps_base_oversubscribe=yes

#   cd ${_base}-${pkgver}
#   local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
#   PYTHONPATH="${PWD}"/build/lib.linux-${CARCH}-cpython-${_pyversion/./} python setup.py test
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
