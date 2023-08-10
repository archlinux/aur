# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyprecice
pkgname=python-${_base}
pkgdesc="Python language bindings for the preCICE coupling library"
pkgver=2.5.0.4
pkgrel=1
arch=(x86_64)
url="https://github.com/${_base/py/}/python-bindings"
license=(LGPL3)
depends=(precice python-mpi4py)
makedepends=(python-build python-installer python-setuptools cython python-pkgconfig python-wheel)
source=(python-bindings-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('cd0397c18a769d1294ff3223b6b877686e9280611ff995115296cabecae4c31f4ec42e1af343a619603483160eeff014bbf592e43a59a74f2ac2aa9042963faa')

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
