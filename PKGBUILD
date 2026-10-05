# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PySR
pkgname=python-${_base,,}
pkgver=2.6.2
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
sha512sums=('cd984c1ca5a2822eb45ae6304a6df576ef6a92d2641accb28fa60a149041791977351cc46f4bbfe3c6f0829b6f2b644eaf802f170f9fb732d3624af433e57911')

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
