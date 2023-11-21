# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PyPardiso
pkgname=python-${_base,,}
pkgver=0.4.4
pkgrel=1
pkgdesc="Python interface to the Intel MKL Pardiso library to solve large sparse linear systems of equations"
arch=(any)
url="https://github.com/haasad/${_base}Project"
license=('custom:BSD-3-clause')
depends=(intel-oneapi-mkl python-scipy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest)
source=(${_base}Project-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0ccabdeda5357c555473b35eb5245f445d3feec13b8647556a5ff08fc19c5f8c4d6bafc14af89f9b6bb080040c7b5217d107dd7f0b4ea33ae25ceef62ababefa')

build() {
  cd ${_base}Project-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
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
