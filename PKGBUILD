# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=fenicsprecice
pkgname=python-${_base}
pkgdesc="FEniCS-preCICE adapter is a preCICE adapter for the open source computing platform FEniCS"
pkgver=2.2.0
pkgrel=1
arch=(any)
url="https://github.com/precice/${_base/precice/-adapter}"
license=(LGPL-3.0-or-later)
depends=(python-pyprecice python-dolfin python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base/precice/-adapter}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e3f9d44f7c4a396928182a2ab751f01656f2804a13debde251c32248e5c1d2e9bba1164d9ec86d7258c70c7f874a6c3318b0db05a78e5590692b4f0b8a10c704')

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
