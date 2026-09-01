# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=foamlib
pkgname=python-${_base}
pkgdesc="A Python interface for interacting with OpenFOAM"
pkgver=1.7.10
pkgrel=1
arch=(any)
url="https://github.com/gerlero/${_base}"
license=(GPL-3.0-or-later)
depends=(python-aioshutil python-multicollections python-numpy python-pyparsing python-rich)
makedepends=(python-build python-installer python-uv-build)
checkdepends=(python-pytest)
optdepends=(
  'openfoam-com: required to run simulations (openfoam.com distribution)'
  'openfoam-org: required to run simulations (openfoam.org distribution)'
  'python-pandas: preprocessing, postprocessing, and examples'
  'python-pydantic: preprocessing and examples'
  'python-defusedxml: postprocessing and examples'
  'python-plotly: examples'
  'python-scipy: examples')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('cb4b97f20b054af65360a45b6ad09cd8e4ee66e997ff43f2dacce5f91e340c6509d8c468148c882f663bf2b0993b6515efd5793437f4adea982e9a392e39d732')

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
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
