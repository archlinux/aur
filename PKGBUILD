# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=adios4dolfinx
pkgname=python-${_base}
pkgdesc="Wrappers for reading/writing DOLFINx meshes/functions with ADIOS2"
pkgver=0.9.3
pkgrel=1
arch=(any)
url="https://github.com/jorgensd/${_base}"
license=(MIT)
depends=(python-fenics-dolfinx adios2)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-ipyparallel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('5d0d129e9c2bbbebd478cf3b02cecd9bc9716525f1346764760cb700b90cf6121d4b10966fca509770cf28c2cf80386499d8a83a7a3e1b5ef6ed63818969be69')

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
