# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyprecice
pkgname=python-${_base}
pkgdesc="Python language bindings for the preCICE coupling library"
pkgver=2.4.0.0
pkgrel=2
arch=(x86_64)
url="https://github.com/${_base/py/}/python-bindings"
license=(LGPL3)
depends=(precice python-mpi4py)
makedepends=(python-setuptools cython)
checkdepends=(openssh)
source=(python-bindings-${pkgver}::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c4001e676e623d299f9be214b1f04d95497e93fed1d68a1bf3ac1d12cd154fc6c6186c7918ebb7e5ebb73de57f783e9d9509a5b23ad42e8562aecec2925d413c')

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
