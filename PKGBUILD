# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrea Feletto <andrea@andreafeletto.com>
_base=gnuplot_kernel
pkgname=jupyter-${_base}
pkgver=0.4.1
pkgrel=6
pkgdesc="A Jupyter/IPython kernel for gnuplot"
arch=('any')
url="https://github.com/has2k1/${_base}"
license=(BSD)
depends=(jupyter-metakernel gnuplot)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
install=${pkgname}.install
source=(${_base}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('00e51bc5cf77d3618ed53e0e2224d0b03ac4ac4a283d9991896a4a84abe441c0fd2ec592afd5a4415e84dfd2d3b707a13de43bbd002d3be1585e308e0942a6fd')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
