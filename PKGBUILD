# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=MPSPlots
pkgname=python-${_base,,}
pkgdesc="A matplotlib wrapper for defered plots and plotting styles"
pkgver=1.5.2
pkgrel=1
arch=(any)
url="https://github.com/MartinPdeS/${_base}"
license=(MIT)
depends=(python-matplotlib python-pydantic python-pathvalidate python-pyvista python-shapely)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('384a72d76139e2f6b44b2b18b54710bff02fb6f6129c84179b56cd33bfa9c0fedd2771ecbca23e27fbd2693610f2112247b4de04ec0ec7f43376c94c869aa80b')

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
