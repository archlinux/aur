# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PINA
pkgname=python-${_base,,}-mathlab
pkgver=0.2.6.post2603
pkgrel=1
pkgdesc="Physics-Informed Neural networks for Advanced modeling"
url="https://github.com/mathLab/${_base}"
arch=(any)
license=(MIT)
depends=(python-pytorch-lightning)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('1eacdaa0ffe0fb55b8b92cd3dea07766ffac1666dfc6ea4c582bb361a67a8e2e1df586e3c3f8cc7b1c0dc0cafee8dae55aa7dcb68912494ea235d027a7ef827f')

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
  install -Dm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
