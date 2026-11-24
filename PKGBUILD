# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=foamlib
pkgname=python-${_base}
pkgdesc="A Python interface for interacting with OpenFOAM"
pkgver=1.10.5
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
sha512sums=('fe94582f954e325b27d55d9d600dbb0ce0a6ed677927fb749bd58a9b1cff0d93adfb851ef70c5de62ca96bc096dc34a688450fecb3b969cfcbee618921c632d8')

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
