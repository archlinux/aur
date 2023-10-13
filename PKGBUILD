# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=eigency
pkgname=python-${_base}
pkgver=3.4.0.1
pkgrel=1
pkgdesc="Cython interface between the numpy arrays and the Matrix/Array classes of the Eigen C++ library"
arch=(x86_64)
url="https://github.com/wouterboomsma/${_base}"
license=(MIT)
depends=(eigen python-numpy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel cython) # python-oldest-supported-numpy
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('9eec12a763549f12c8dc3fc1419a8e484baa887c9808f464fdaf19b621f5d560d015e5daa51ee37e8371229cb8377c3f1d65a66ab75489ba04de0f383d20d3d5')

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
