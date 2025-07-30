# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=adios4dolfinx
pkgname=python-${_base}
pkgdesc="Wrappers for reading/writing DOLFINx meshes/functions with ADIOS2"
pkgver=0.9.4
pkgrel=1
arch=(any)
url="https://github.com/jorgensd/${_base}"
license=(MIT)
depends=(python-fenics-dolfinx python-packaging adios2)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-ipyparallel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('aa74641ffd05e56cae35735dcc1d0190f51f7af187a7c6ce6513c24b48e4bba9ea67d6914ee2bd838d0d7c2b89dc1c8a3b5fc21cd4733df218f42c6871d4c7d2')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  source /etc/profile.d/petsc.sh
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    --ignore=tests/test_mesh_writer.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
