# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=MockMPI
pkgname=python-${_base,,}
pkgver=0.8.3
pkgrel=1
pkgdesc="A tool for mocking mpi4py for testing"
arch=(any)
url="https://github.com/rmjarvis/${_base}"
license=(BSD-2-Clause)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ba7197b9d9f01e2c6226aaca9a99d5d4645d3c9c98bdd4d454fe4458f14dd9b751006e90822f78f558f81eb21f3e64a62039b0fa264408f93659af35bc824bcf')

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
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
