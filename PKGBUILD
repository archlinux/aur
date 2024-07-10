# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=nutils
pkgname=python-${_base}
pkgdesc="Numerical Utilities for Finite Element Analysis"
pkgver=8.8
pkgrel=1
arch=(any)
url="https://github.com/evalf/${_base}"
license=(MIT)
depends=(python-appdirs python-bottombar python-numpy python-nutils-poly python-psutil python-stringly python-treelog)
makedepends=(python-build python-installer python-flit-core) # python-wheel
checkdepends=(python-pytest python-matplotlib graphviz python-scipy intel-oneapi-mkl python-meshio)
optdepends=('python-scipy: for Scipy matrix backend support'
  'intel-oneapi-mkl: for MKL matrix backend support'
  'python-matplotlib: for interpolation support'
  'python-meshio: for parsing gmsh files')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c03ee685025f7db4e9df98ceb3818f40296082f4dd953fc45a4a70aea122297b5e9c903a5ed9fa2e880c1e34d16bd5f6dfda314d97fc6993e23096ce54503271')

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
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
