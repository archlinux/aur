# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=drawarrow
pkgname=python-${_base}
pkgdesc="Drawing arrows for matplotlib made easy"
pkgver=0.1.0
pkgrel=1
arch=(x86_64)
url="https://github.com/JosephBARBIERDARNAL/${_base}"
license=(MIT)
depends=(python-matplotlib)
makedepends=(python-build python-installer python-setuptools)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('01866464433b2ef13d28a1b7826d6a90eba1efcab25b400c21ea82088dce865d79a151c20280bae31649c59fb8507bdead9f82aa145d85cedcbc0c8b871ffd30')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --ignore=tests/test_create_lots_of_arrows.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
