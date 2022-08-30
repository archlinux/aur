# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyprecice
pkgname=python-${_base}
pkgdesc="Python language bindings for the preCICE coupling library"
pkgver=2.5.0.0
pkgrel=1
arch=(x86_64)
url="https://github.com/${_base/py/}/python-bindings"
license=(LGPL3)
depends=(precice python-mpi4py)
makedepends=(python-setuptools cython python-pkgconfig)
checkdepends=(openssh)
source=(python-bindings-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6fd9582b1da9fd15a1d201e3a5e7bfdea66933f0a4e939f48f1644dcb5d9b649d3b6e28e89199bc09607d0a9f158a93df63f9d501e23c16bb81edcb221cdcded')

build() {
  cd python-bindings-"${pkgver}"
  python setup.py clean --all
  python setup.py \
    build_ext \
    --include-dirs=/usr/include \
    --library-dirs=/usr/lib \
    --inplace
}

check() {
  if [ -z "$(ldconfig -p | grep libcuda.so.1)" ]; then
    export OMPI_MCA_opal_warn_on_missing_libcuda=0
  fi
  cd python-bindings-"${pkgver}"
  # https://github.com/precice/python-bindings/issues/1
  python setup.py test
}

package() {
  cd python-bindings-"${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  install -Dm 644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
