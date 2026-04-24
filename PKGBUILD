# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=numba-mpi
pkgname=python-${_base}
pkgdesc="Numba @njittable MPI wrappers tested on Linux, macOS and Windows"
pkgver=1.1.9
pkgrel=1
arch=(any)
url="https://github.com/${_base}/${_base}"
license=(GPL-3.0-or-later)
depends=(python-numba python-mpi4py python-psutil)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('fb7038566b325f3766b08118ee7c38f7d02a2fdc6389ab37f990933f62766138cc93c13c29b33380fed87bcf73e8c35fb7db0cea67803a690b1758f9c23fab14')

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
