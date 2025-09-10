# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=MPSPlots
pkgname=python-${_base,,}
pkgdesc="A matplotlib wrapper for defered plots and plotting styles"
pkgver=1.8.0
pkgrel=1
arch=(any)
url="https://github.com/MartinPdeS/${_base}"
license=(MIT)
depends=(python-matplotlib python-pydantic python-pathvalidate python-pyvista python-shapely)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b067d7faf79cbfcb6bf08096bd4dcc0f87afc54b81e5f9ff1a5163d0349a0e5313f8f36242d5ce7068857ea11c01c2e9ab5f5b42553a2d03d268270bd19d7a0f')

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
