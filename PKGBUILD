# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=foamlib
pkgname=python-${_base}
pkgdesc="A Python interface for interacting with OpenFOAM"
pkgver=1.3.14
pkgrel=1
arch=(any)
url="https://github.com/gerlero/${_base}"
license=(GPL-3.0-or-later)
depends=(python-aioshutil python-multicollections python-numpy python-pyparsing python-rich openfoam-com)
makedepends=(python-build python-installer python-uv-build)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b7747fd839429a586208a3a8dd3fcf6c2eb4b2d495d86005535ab491c65b9a93d3b37410cf94a40599408996992720ca336b5446b0989a267ae576bea1c4643d')

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
