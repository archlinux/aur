# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PyFinitDiff
pkgname=python-${_base,,}
pkgdesc="A package for generating finite-difference matrices, particularly suited for physics and engineering applications"
pkgver=2.3.1
pkgrel=1
arch=(any)
url="https://github.com/MartinPdeS/${_base}"
license=(MIT)
depends=(python-scipy python-mpsplots python-tabulate)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e1739d284c875c09e807c1b9468cda246cabe8ea42e285a7578380b324d5fd3a353fb8956d8c8cd6bb85b9e75c845c38936d3d7692f5fb043ad5966e0f8ab123')

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
