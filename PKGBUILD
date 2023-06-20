# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=treelog
pkgname=python-${_base}
pkgdesc="Logging framework that organizes messages in a tree structure"
pkgver=1.0
pkgrel=2
arch=(any)
url="https://github.com/evalf/${_base}"
license=(MIT)
depends=(python-typing_extensions)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('316a5784f23165b10383e354b9f798bbec4cdc532c49db068af5c418df865e2ddb64a51e87216f0389e66118d58e34d7c583b6ff4a5b95a8c03e4c6b0f71a845')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m unittest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
