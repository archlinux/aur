# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=python-pyro-hydro
pkgdesc="A python hydrodynamics code for teaching and prototyping"
pkgver=4.3.0
pkgrel=1
arch=(any)
url="https://github.com/python-hydro/pyro2"
license=(BSD-3-Clause)
depends=(python-numba python-matplotlib python-h5py-openmpi)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest)
source=(pyro2-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('33711d0b8dd9a5504d204e57a3f3c38d05b52b14f3123cd3e201d6d3c6741056e13592803a0a3c06b89fe852dfe9b52342bce3f8db953dc24f741d45171fd19f')

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
