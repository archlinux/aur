# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=succulent
pkgname=python-${_base}
pkgver=0.2.1
pkgrel=1
pkgdesc="Collect POST requests easily"
arch=(x86_64)
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
depends=(python-pandas python-yaml python-flask)
makedepends=(python-build python-installer python-poetry-core python-wheel)
checkdepends=(python-pytest python-mock)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('0aa582f43dbb148dd8acbb1cdbf9bfe18911c589cd74252457a3b666bccf4901ca29e2b7488d4847dcbce821cecd453e407cb57649d1d6613102ee7d3fd2baea')

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
