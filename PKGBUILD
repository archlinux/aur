# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=jacobi
pkgname=python-${_base}
pkgdesc="Compute numerical derivatives"
pkgver=0.9.2
pkgrel=1
arch=(any)
url="https://github.com/HDembinski/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest-benchmark)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('1998ac2a0b8e03da32b6d287925befedd27833a2f6fafef3c07a0f822be3dddfd2425493360511a7abc863994545a26ac98cca7b7c129742a63987eb58b25dbb')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
