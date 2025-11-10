# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=bmi
pkgname=python-${_base}py
pkgdesc="Basic Model Interface for Python"
pkgver=2.0.1
pkgrel=1
arch=(any)
url="https://github.com/csdms/${_base}-python"
license=(MIT)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-click python-black python-jinja)
source=(${_base}-python-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ba9986011f848af2a7104b0b3ce6528cfc80dcee2d70756fd0f4de4f3ac08b20fb97b587a42e50ac88541330acaa64af962645f77051c2b988515908cbb93bb6')

build() {
  cd ${_base}-python-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-python-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-python-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
