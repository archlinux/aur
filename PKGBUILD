# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PyPardiso
pkgname=python-${_base,,}
pkgver=0.4.3
pkgrel=1
pkgdesc="Python interface to the Intel MKL Pardiso library to solve large sparse linear systems of equations"
arch=(any)
url="https://github.com/haasad/${_base}Project"
license=('custom:BSD-3-clause')
depends=(intel-oneapi-mkl python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}Project-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4ced5d056f707ab282e77550fb1d36d68eb80a090e8cf2e8f5ce37797dcbd31460ead1a17e86ae42e7922d1741d01437b7482fc31c2f9c5a3240767a57d9e263')

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
