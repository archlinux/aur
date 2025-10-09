# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=adios4dolfinx
pkgname=python-${_base}
pkgdesc="Wrappers for reading/writing DOLFINx meshes/functions with ADIOS2"
pkgver=0.9.6
pkgrel=1
arch=(any)
url="https://github.com/jorgensd/${_base}"
license=(MIT)
depends=(python-fenics-dolfinx python-packaging adios2)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-ipyparallel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('433e1f4cf4053fc72fd228d37a47e4cfd5229044417accfcb7e415972c24775756faaa64ea2884cdd593167ea6dd90da0ba862fb6fba55116aa072341545c66a')

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
