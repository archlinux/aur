# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyprecice
pkgname=python-${_base}
pkgdesc="Python language bindings for the preCICE coupling library"
pkgver=2.5.0.2
pkgrel=2
arch=(x86_64)
url="https://github.com/${_base/py/}/python-bindings"
license=(LGPL3)
depends=(precice python-mpi4py)
makedepends=(python-build python-installer python-setuptools cython python-pkgconfig python-wheel)
source=(python-bindings-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d1ad22dd7a312dde8533e80f4051628d2553b2e0b11fbe2475871d685fc60320bdbda926088f0076822b7840fe5a3049965b85e081b220cc6320d65851335ef6')

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
