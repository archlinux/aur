# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=python-pyro-hydro
pkgdesc="A python hydrodynamics code for teaching and prototyping"
pkgver=4.1.0
pkgrel=2
arch=(any)
url="https://github.com/python-hydro/pyro2"
license=(BSD-3-Clause)
depends=(python-numba python-matplotlib python-h5py-openmpi)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest)
source=(pyro2-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('08fa7b696cb7730eb455610646d0eaa45005d36717e00bf7bb8a538304baaf72a41544ec7b456626d110cdf901d2e4d17e36a8e9014fdb5be62c6368e9841602')

build() {
  cd pyro2-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd pyro2-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest pyro/tests
}

package() {
  cd pyro2-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
