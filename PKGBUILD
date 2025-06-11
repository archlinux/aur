# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=MPSPlots
pkgname=python-${_base,,}
pkgdesc="A matplotlib wrapper for defered plots and plotting styles"
pkgver=1.6.4
pkgrel=1
arch=(any)
url="https://github.com/MartinPdeS/${_base}"
license=(MIT)
depends=(python-matplotlib python-pydantic python-pathvalidate python-pyvista python-shapely)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4101223fe8723f1dd8483ab2ad2293681fa208807365e3e289d67fe5ea554549e5bff9645035ad7a17f8bc87c085634b5d71860f39cdfd76f0ffc418d611f8e6')

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
