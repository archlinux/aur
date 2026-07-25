# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=python-pyro-hydro
pkgdesc="A python hydrodynamics code for teaching and prototyping"
pkgver=4.5.1
pkgrel=1
arch=(any)
url="https://github.com/python-hydro/pyro2"
license=(BSD-3-Clause)
depends=(python-numba python-matplotlib python-h5py-openmpi)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest)
source=(pyro2-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('56b5cfea76006abc9dcba929cd0b1fe4fea39e15dda036d24f16f3e626eb32a37e3371161b9690ffe2bbfc79ccac6f98bf4cc0243520bdf7bd7c972c89425095')

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
