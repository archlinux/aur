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
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('ea392dcaef51156743b46a0cef712b65da37a20891a1a3a8b26625511d95849fa9aeea2652601ff48522cfdc11dc7fc3d84aa4f2a60758035b218e2cf4f3c18d')

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
