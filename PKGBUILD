# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=foamlib
pkgname=python-${_base}
pkgdesc="A Python interface for interacting with OpenFOAM"
pkgver=1.3.20
pkgrel=1
arch=(any)
url="https://github.com/gerlero/${_base}"
license=(GPL-3.0-or-later)
depends=(python-aioshutil python-multicollections python-numpy python-pyparsing python-rich openfoam-com)
makedepends=(python-build python-installer python-uv-build)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d08a62a240d81955e86ff0764706f6b3b607748befc74f74dcb9a4b69d1a739b92f3b733eb80ed6a19deb3e086296eef3a576092e6bf755f1224f36ce16f8c92')

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
