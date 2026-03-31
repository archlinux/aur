# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PySR
pkgname=python-${_base,,}
pkgver=1.5.10
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
sha512sums=('4c46b733f4ca1fab1ca58de568814b8a9febfa62f414a21f7c51f621e084501fc5b6809f786e477f69b8ee54297025e680f3e6d6c2df3d395199d27d5d4adfd1')

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
