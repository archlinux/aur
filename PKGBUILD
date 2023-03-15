# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sigvald Marholm <marholm@marebakken.com>
# Contributor: Georg S. Voelker <voelker@maibox.org>
# Based on python-instant-git, maintained by Lucas H. Gabrielli <heitzmann@gmail.com>

_base=mshr
pkgname=python-${_base}
pkgdesc="Mesh generation component of FEniCS (python interface)"
pkgver=2019.1.0
pkgrel=2
arch=('x86_64')
url="https://bitbucket.org/fenics-project/${_base}"
license=('GPL3')
conflicts=('python-mshr-git')
depends=("mshr=${pkgver}" "python-dolfin>=${pkgver}")
makedepends=('cmake' 'python-mpi4py')
checkdepends=('openssh')
options=(!emptydirs)
source=(${_base}-${pkgver}.tar.gz::${url}/downloads/${_base}-${pkgver}.tar.gz)
sha512sums=('980a1566c9089fc9784582e312d0683fc30b093a57164126873f5c9a437679654e35a0c10a3fa415d69055f87964492c66f23b4ce8ca38213ce848fc4a8dcc7e')

build() {
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
  PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}" python ${_base}-${pkgver}/test/test-*.py
}

package() {
  cd ${_base}-${pkgver}/python
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
