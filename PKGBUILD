# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=optype
pkgname=python-${_base}
pkgdesc="Building blocks for precise & flexible type hints"
pkgver=0.9.2
pkgrel=1
arch=(x86_64)
url="https://github.com/jorenham/${_base}"
license=(BSD-3-Clause)
depends=(python-typing_extensions)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest python-beartype)
optdepends=('python-numpy: for Numpy Support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('15b2a334e1d5d13419f53baea96381d6264453c230c2f5b4007eaab3b923285cbf48e4c618e161481b1120172bc99f64ee3ed21eed9ba7b885de5009810ad282')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
