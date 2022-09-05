# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyprecice
pkgname=python-${_base}
pkgdesc="Python language bindings for the preCICE coupling library"
pkgver=2.5.0.1
pkgrel=1
arch=(x86_64)
url="https://github.com/${_base/py/}/python-bindings"
license=(LGPL3)
depends=(precice python-mpi4py)
makedepends=(python-setuptools cython python-pkgconfig)
checkdepends=(openssh)
source=(python-bindings-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7df95399ba2ee382e78f4c49c44ccd91b66f3e7715f922274a77920be67165bfa8b98f39db03b42320d9f5625763dd2791a02160722ef9acfab9ed60ecebc3ed')

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
