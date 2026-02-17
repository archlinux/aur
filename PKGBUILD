# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=fenicsprecice
pkgname=python-${_base}
pkgdesc="FEniCS-preCICE adapter is a preCICE adapter for the open source computing platform FEniCS"
pkgver=2.3.0
pkgrel=1
arch=(any)
url="https://github.com/precice/${_base/precice/-adapter}"
license=(LGPL-3.0-or-later)
depends=(python-pyprecice python-dolfin python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base/precice/-adapter}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0e5d595a7e05e8abd8582a26b73f6b9cc0f6fdc97487f04981a7532fbe29afc34bda5a163faed4017f8545afb45a72130fe8d1928a860e8135edef8be8c18438')

prepare() {
  sed -i 's/numpy>=1.13.3, <2/numpy/' ${_base/precice/-adapter}-${pkgver}/setup.py
  sed -i 's/mpi4py<4/mpi4py/' ${_base/precice/-adapter}-${pkgver}/setup.py
}

build() {
  cd ${_base/precice/-adapter}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base/precice/-adapter}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base/precice/-adapter}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
