# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=fenicsprecice
pkgname=python-${_base}
pkgdesc="FEniCS-preCICE adapter is a preCICE adapter for the open source computing platform FEniCS"
pkgver=1.4.0
pkgrel=1
arch=(any)
url="https://github.com/precice/${_base/precice/-adapter}"
license=(LGPL3)
depends=(python-pyprecice python-dolfin python-scipy)
makedepends=(openssh python-setuptools)
source=(${_base/precice/-adapter}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ee5c50fbff18242e9bbee4cdf5a80a2b870c4e96c0f689838a926f33cfb08960a8300b3d8821d55f62ecf9cf8b8a78bd8e3ed9ef5338644240deec61e075e193')

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
