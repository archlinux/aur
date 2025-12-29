# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Daniel Moch <daniel@danielmoch.com>
_base=blurhash
pkgname=python-halcy-${_base}
pkgver=1.1.5
pkgrel=2
pkgdesc="Pure-Python implementation of the blurhash algorithm"
arch=(any)
url="https://github.com/halcy/${_base}-python"
license=(MIT)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov python-numpy python-pillow)
provides=(python-blurhash)
conflicts=(python-blurhash)
source=(${_base}-python-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d8569c602a68b3f635d2df83492b877bacbc8f06c92c14d33f68214ee424e059db75e43dceaceed0c8fdcaa08c76f5dbeabfccc74c82fb1301a412f93269c295')

build() {
  cd ${_base}-python-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-python-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}-python-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
