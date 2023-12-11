# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=succulent
pkgname=python-${_base}
pkgver=0.3.0
pkgrel=1
pkgdesc="Collect POST requests easily"
arch=(x86_64)
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
depends=(python-pandas python-yaml python-flask)
makedepends=(python-build python-installer python-poetry-core python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('4eede9623627ddab2e0fa34ec33786ce0e5564a7a16b0dddda2c8436695a619fe603e5677fecc19b763bafd7bda40074869f36d70f91b52b0e3a1092c6b65a03')

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
