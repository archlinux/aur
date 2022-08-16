# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=fenicsprecice
pkgname=python-${_base}
pkgdesc="FEniCS-preCICE adapter is a preCICE adapter for the open source computing platform FEniCS"
pkgver=1.3.0
pkgrel=5
arch=(any)
url="https://github.com/precice/${_base/precice/-adapter}"
license=(LGPL3)
depends=(python-pyprecice python-dolfin python-scipy)
makedepends=(openssh python-setuptools)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('fb5a1b84c6e5cd66876a0c323881d16359d1e3e55eef054deba07c65a5a87148ee06fdb9a16eedda9120255cf161238767a1791b1994cf03ddb5943e22df00ff')

build() {
  if [ -z "$(ldconfig -p | grep libcuda.so.1)" ]; then
    export OMPI_MCA_opal_warn_on_missing_libcuda=0
  fi
  cd ${_base/precice/-adapter}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base/precice/-adapter}-${pkgver}
  python setup.py test -s tests.unit
  python setup.py test -s tests.integration
}

package() {
  cd ${_base/precice/-adapter}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
