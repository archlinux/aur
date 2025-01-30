# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=python-pyro-hydro
pkgdesc="A python hydrodynamics code for teaching and prototyping"
pkgver=4.5.0
pkgrel=1
arch=(any)
url="https://github.com/python-hydro/pyro2"
license=(BSD-3-Clause)
depends=(python-numba python-matplotlib python-h5py-openmpi)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest)
source=(pyro2-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('fa3118cf25a3881a66fbce2895ccf5a9167f53f7fc1cc05b65f642f747426f4a7ec1293a025dd4cb356ea13738a1988ea81a7535eae1a0e9bd701087925c784f')

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
