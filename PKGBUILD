# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=MockMPI
pkgname=python-${_base,,}
pkgver=0.8.1
pkgrel=1
pkgdesc="A tool for mocking mpi4py for testing"
arch=(any)
url="https://github.com/rmjarvis/${_base}"
license=('custom:BSD-2-clause')
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7cb50cd8e8f5001bf87fc0bcc2666cedfa12f69cfeaf7341c46897d1f41e66d75bb54329736eadf8a796e6d2c4f02f5f4bcae085ef8b804d5203ebf72bb091af')

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
