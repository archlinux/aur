# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=eigency
pkgname=python-${_base}
pkgver=5.0.1.1
pkgrel=1
pkgdesc="Cython interface between the numpy arrays and the Matrix/Array classes of the Eigen C++ library"
arch=(x86_64)
url="https://github.com/wouterboomsma/${_base}"
license=(MIT)
depends=(eigen python-numpy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel cython) # python-oldest-supported-numpy
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('075da0edfda40fc08c899b0b1fc4d8a2fd6e26c23a9cb2c9ed1c9947f08a26e555863bc61489fc91ea833d823dabf4c157020acf7489bab61185229dd8b34256')

prepare() {
  # https://github.com/wouterboomsma/eigency/pull/59
  sed -i 's/#include <Eigen\/Core>/#include <eigen3\/Eigen\/Core>/' ${_base}-${pkgver}/eigency/eigency_cpp.h
  sed -i 's/#include <Eigen\/Core>/#include <eigen3\/Eigen\/Core>/' ${_base}-${pkgver}/eigency/eigency.h
}

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python setup.py build_ext --inplace
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
