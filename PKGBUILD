# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=adios4dolfinx
pkgname=python-${_base}
pkgdesc="Wrappers for reading/writing DOLFINx meshes/functions with ADIOS2"
pkgver=0.11.0
pkgrel=1
arch=(any)
url="https://github.com/jorgensd/${_base}"
license=(MIT)
depends=(python-fenics-dolfinx python-packaging adios2)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-ipyparallel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ad3b66a41514f493594b635d735d7680ec3f554cd23e5690e789a2f9c3719ebdbaf18b902ef8e4ee9eac9076634db4ab41df3f84d67e07c5b1ed2ca480685c9a')

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
