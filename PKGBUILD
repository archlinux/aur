# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=foamlib
pkgname=python-${_base}
pkgdesc="A Python interface for interacting with OpenFOAM"
pkgver=1.1.1
pkgrel=1
arch=(any)
url="https://github.com/gerlero/${_base}"
license=(GPL-3.0-or-later)
depends=(python-aioshutil python-numpy python-pyparsing python-rich openfoam-com)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c276650e5968938b7dea145e751a91faf8152903a9fcef94534b61397d433fadea0f00c010587093bf79a57da432c29e4f6cde5a9a15054560e019663a9c7dff')

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
