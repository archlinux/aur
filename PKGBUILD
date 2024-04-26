# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=dolfinx
pkgname=python-fenics-${_base}
pkgdesc="Next generation FEniCS problem solving environment (python interface)"
pkgver=0.8.0
pkgrel=1
arch=(x86_64)
url="https://github.com/FEniCS/${_base}"
license=(LGPL-3.0-or-later GPL-3.0-or-later)
depends=(dolfinx python-mpi4py)
makedepends=(python-build python-installer python-scikit-build-core python-wheel nanobind)
checkdepends=(python-pytest python-sympy python-scipy python-matplotlib python-numba)
optdepends=('python-pyvista: for plotting'
  'python-numba: for jit support'
  'slepc: for eigenvalue solver support'
  'gmsh: for extract data from Gmsh models')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('2f3ee72733f058bfa77548a3f5955fd43ad24a1d5643a26cf513b263c9ae089d73b7062bc8ebc9986baebc26804f9763a7ef8f957ff1b532605ad96310862d35')

prepare() {
  sed -i 's/^wheel.license-files/#wheel.license-files/' ${_base}-${pkgver}/python/pyproject.toml
  sed -i 's/^license/#license/' ${_base}-${pkgver}/python/pyproject.toml
}

build() {
  cd ${_base}-${pkgver}/python
  source /etc/profile.d/petsc.sh
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer python/dist/*.whl
  MPLBACKEND=Agg test-env/bin/python -m pytest python/test/unit
  MPLBACKEND=Agg test-env/bin/python -m pytest python/demo/test.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" python/dist/*.whl
  install -Dm 644 COPYING* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
