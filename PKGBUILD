# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PySR
pkgname=python-${_base,,}
pkgver=2.0.0
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
sha512sums=('9f706c38ac16b4a395db4ea673b99fe8663b149681be928188cb71bfac78009c1da062b44ca3ada6abdbc5dd860efaae99c75d73bab451edb8dce8813d354eaa')

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
