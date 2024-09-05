# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=python-pyro-hydro
pkgdesc="A python hydrodynamics code for teaching and prototyping"
pkgver=4.2.0
pkgrel=1
arch=(any)
url="https://github.com/python-hydro/pyro2"
license=(BSD-3-Clause)
depends=(python-numba python-matplotlib python-h5py-openmpi)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest)
source=(pyro2-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('b71ae3bc3193f0750f90db1280e3bee2124ccf402d15329cfff61f8d33068db84fb3fba3d4cd6915bc500d986093a4a1932f2ae0543e86336e51c39f1b0eedf8')

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
