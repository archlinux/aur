# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=fenicsprecice
pkgname=python-${_base}
pkgdesc="preCICE adapter for the open source computing platform FEniCS"
pkgver=2.3.0
pkgrel=2
arch=(any)
url="https://github.com/precice/${_base/precice/-adapter}"
license=(LGPL-3.0)
depends=(python-pyprecice python-dolfin python-scipy)
makedepends=(python-build python-installer python-setuptools-git-versioning python-wheel git)
checkdepends=(python-pytest)
source=("git+${url}.git#tag=v${pkgver}")
sha512sums=('7128b2bdcdea825a3682fb72341535eb9324790d772ef0b2c706c768d5c24f0ae6eed924a5a42ca2154b8bdf3f954bc479c5c2461bd8294a284279d548ded156')

prepare() {
  sed -i 's/numpy>=1.13.3, <2/numpy/' ${_base/precice/-adapter}/setup.py
  sed -i 's/mpi4py<4/mpi4py/' ${_base/precice/-adapter}/setup.py
}

build() {
  cd ${_base/precice/-adapter}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base/precice/-adapter}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base/precice/-adapter}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
