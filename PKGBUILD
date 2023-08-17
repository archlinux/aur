# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PyPardiso
pkgname=python-${_base,,}
pkgver=0.4.2
pkgrel=2
pkgdesc="Python interface to the Intel MKL Pardiso library to solve large sparse linear systems of equations"
arch=(any)
url="https://github.com/haasad/${_base}Project"
license=('custom:BSD-3-clause')
depends=(intel-oneapi-mkl python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}Project-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  unsorted_indices.patch::${url}/commit/a591a30832a1250fb31ca64a4903d50bca8de733.patch)
sha512sums=('defc59769f40447099260f4f9ef9b6707f3c09708275f74fedc44226faa259a7d41b39aaefd36c203a6eb2623167f7fde6404d7d96d551ac9001e3b6c69dd1ef'
  'eff0ddae42e22bb3f4922b01ce384169ad3afd6a76a98e91869b79ed8b60c8842d3981c0f742e79ef90e587f5ee7af923fc27c044c64e2c1a0fed5f7c8d5b53f')

prepare() {
  cd ${_base}Project-${pkgver}
  patch -p1 -i ../unsorted_indices.patch
}

build() {
  cd ${_base}Project-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}Project-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}Project-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
