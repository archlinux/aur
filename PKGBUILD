# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PySR
pkgname=python-${_base,,}
pkgver=2.7.3
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
sha512sums=('5edd0d21bcb40fd33776e1cd2cb9e656c052f38c340fbdfa2006501a1dc32bc5d4e19c6f36414a8ef57a8ecefb185be2015e005a6e3d4f93340cd904b4f5338d')

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
