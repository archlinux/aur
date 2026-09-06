# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=foamlib
pkgname=python-${_base}
pkgdesc="A Python interface for interacting with OpenFOAM"
pkgver=1.8.1
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
sha512sums=('d1d55fa3840cfd0cc8ff15f173a5c750c9d6d61bb8d9553521adfe600008d78358b03c693f68edd0eb034910823fb4fec73be69dec04f4f70a77728480ea1ce6')

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
