# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PySR
pkgname=python-${_base,,}
pkgver=2.1.0
pkgrel=1
pkgdesc="Simple and efficient symbolic regression"
arch=(x86_64)
url="https://github.com/MilesCranmer/${_base}"
license=(Apache-2.0)
depends=(python-sympy python-pandas python-scikit-learn python-juliacall
  python-click python-typing_extensions)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest python-nbval)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('113a0a83ac88364cca1b27f29ce275c34ca4e38e86f2c9bd7bfa8d39c1c224e3dadf6709fd76bb82533c2e7b957c67230a29dc9062c2f6906458471ef3fb36c3')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pysr test main,cli,startup
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
