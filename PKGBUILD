# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=eigency
pkgname=python-${_base}
pkgver=3.4.0.2
pkgrel=1
pkgdesc="Cython interface between the numpy arrays and the Matrix/Array classes of the Eigen C++ library"
arch=(x86_64)
url="https://github.com/wouterboomsma/${_base}"
license=(MIT)
depends=(eigen python-numpy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel cython) # python-oldest-supported-numpy
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('189d3fe2fed3a17c14f4d7c8d2b4a86e909ca05f9f430d2a029f4f4f1f47e33913bc1a19fc853127721e126064729bd88adc164539aedccef2aac5af2d0bcc08')

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
