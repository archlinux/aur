# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=fenicsprecice
pkgname=python-${_base}
pkgdesc="FEniCS-preCICE adapter is a preCICE adapter for the open source computing platform FEniCS"
pkgver=2.1.0
pkgrel=1
arch=(any)
url="https://github.com/precice/${_base/precice/-adapter}"
license=(LGPL-3.0-or-later)
depends=(python-pyprecice python-dolfin python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base/precice/-adapter}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('71a814deac014f1c9f6e089e1e65c71053ad930b53c77074c0b158a267b0107979cbdc4bca6795d96d5a3e87d7a15afc7462ea807bf102bb5f3bcf428cf304d4')

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
