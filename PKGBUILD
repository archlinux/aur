# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=dolfinx
pkgname=python-fenics-${_base}
pkgdesc="Next generation FEniCS problem solving environment (python interface)"
pkgver=0.6.0
pkgrel=2
arch=(x86_64)
url="https://github.com/FEniCS/${_base}"
license=(LGPL3)
depends=(dolfinx python-mpi4py)
makedepends=(cmake python-setuptools pybind11)
# checkdepends=(python-pytest python-scipy python-matplotlib python-cppimport python-numba openssh)
optdepends=('gmsh: for extract data from Gmsh models')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6e4bbeca9045cdc558fa5cdfd23abe55bdb773b326381eaa25f843e70d9df39c5707bfdf5412ae1845fc680bbbc7cb641f9cf6e4eb2226a760ddaab8d04237bf')

build() {
  cd ${_base}-${pkgver}/python
  source /etc/profile.d/petsc.sh
  python setup.py build
}

# check() {
#   if [ -z "$(ldconfig -p | grep libcuda.so.1)" ]; then
#     export OMPI_MCA_opal_warn_on_missing_libcuda=0
#   fi
#   local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}{sys.version_info.minor}')")
#   PYTHONPATH="${srcdir}/${_base}-${pkgver}/python/build/lib.linux-${CARCH}-cpython-${_pyversion}:$PYTHONPATH" python -m pytest ${_base}-${pkgver}/python/test/unit -k 'not version'
#   PYTHONPATH="${srcdir}/${_base}-${pkgver}/python/build/lib.linux-${CARCH}-cpython-${_pyversion}:$PYTHONPATH" python -m pytest ${_base}-${pkgver}/python/demo/test.py -k 'not demos[path9-demo_static-condensation.py] and not demos[path10-demo_stokes.py] and not demos_mpi[path9-demo_static-condensation.py] and not demos_mpi[path10-demo_stokes.py]'
# }

package() {
  cd ${_base}-${pkgver}/python
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
