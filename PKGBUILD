# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=foamlib
pkgname=python-${_base}
pkgdesc="A Python interface for interacting with OpenFOAM"
pkgver=1.7.4
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
sha512sums=('53da3c4de5e3fe4d95a302b7f035135169272f295313183a93a094ecd6bf902e3c9e4fad63756b2dd925c30bc0c60acca5798152e64189b4bb9fa55fc59d04c5')

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
