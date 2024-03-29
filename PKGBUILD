# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PyPardiso
pkgname=python-${_base,,}
pkgver=0.4.6
pkgrel=1
pkgdesc="Python interface to the Intel MKL Pardiso library to solve large sparse linear systems of equations"
arch=(any)
url="https://github.com/haasad/${_base}Project"
license=(BSD-3-Clause)
depends=(intel-oneapi-mkl python-scipy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest)
source=(${_base}Project-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('201420ce934b6c3ecdb0833df448fc8682920c7e9699ccbe77dda2fb66e4373218b06be77cd7d0ac872e890b8e6e53af38cc03040f4ee7aedb36b7af7f783687')

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
