# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyprecice
pkgname=python-${_base}
pkgdesc="Python language bindings for the preCICE coupling library"
pkgver=2.5.0.3
pkgrel=1
arch=(x86_64)
url="https://github.com/${_base/py/}/python-bindings"
license=(LGPL3)
depends=(precice python-mpi4py)
makedepends=(python-build python-installer python-setuptools cython python-pkgconfig python-wheel)
source=(python-bindings-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7e8d91d44aba2bd418711b76e6dab453258acd7c9af0333827d4a8db912fe2ddb6d50c3c38d071218888bc8c590db4f1884e8cf96200d899d6f44cd6b5398958')

build() {
  cd python-bindings-${pkgver}
  python setup.py clean --all
  python setup.py \
    build_ext \
    --include-dirs=/usr/include \
    --library-dirs=/usr/lib \
    --inplace
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   if [ -z "$(ldconfig -p | grep libcuda.so.1)" ]; then
#     export OMPI_MCA_opal_warn_on_missing_libcuda=0
#   fi
#   cd python-bindings-${pkgver}
#   # FIXME: https://github.com/precice/python-bindings/issues/1
#   python setup.py test
# }

package() {
  cd python-bindings-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
