# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=adios4dolfinx
pkgname=python-${_base}
pkgdesc="Wrappers for reading/writing DOLFINx meshes/functions with ADIOS2"
pkgver=0.8.0
pkgrel=1
arch=(any)
url="https://github.com/jorgensd/${_base}"
license=(MIT)
depends=(python-fenics-dolfinx adios2)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-ipyparallel)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a104dbef03a7c3bf77efce84f2a94ec57d45071d287d9aacdd50318a17527ceb8eadff86ab868919f7a674a20e6e68e931e408245d909c28a3d2b1be51ed254b')

prepare() {
  sed -i 's/.dev0//' ${_base}-${pkgver}/pyproject.toml
}

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
    --ignore=tests/test_checkpointing_vector.py \
    --ignore=tests/test_mesh_writer.py \
    --ignore=tests/test_meshtags.py \
    --ignore=tests/test_original_checkpoint.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
