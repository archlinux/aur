# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyprecice
pkgname=python-${_base}
pkgdesc="Python language bindings for the preCICE coupling library"
pkgver=2.5.0.1
pkgrel=2
arch=(x86_64)
url="https://github.com/${_base/py/}/python-bindings"
license=(LGPL3)
depends=(precice python-mpi4py)
makedepends=(python-setuptools cython python-pkgconfig)
checkdepends=(openssh)
source=(python-bindings-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d2d6b0761e9fc00bec47479e9bc96fce522d86257221d7fda11a82ffca7db1d5b850cca7f76c851663a5735f77c1da6519b958111afff1154afbc13c78080c6d')

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
