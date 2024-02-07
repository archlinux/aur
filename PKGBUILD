# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=numba-mpi
pkgname=python-${_base}
pkgdesc="Numba @njittable MPI wrappers tested on Linux, macOS and Windows"
pkgver=0.40
pkgrel=1
arch=(any)
url="https://github.com/${_base}/${_base}"
license=(GPL3)
depends=(python-numba python-mpi4py python-psutil)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('48e4f9aa1d53effd2b9c525510114051cc79335fc7c40bfcce0815c81368de1449c1ba6f7b974cbeae375545f5934b23670028f8a86fee94981504b2f2c37e89')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    --ignore=tests/api/test_isend_irecv.py \
    --ignore=tests/api/test_send_recv.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
