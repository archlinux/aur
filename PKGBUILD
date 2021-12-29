# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyprecice
pkgname=python-${_base}
pkgdesc="Python language bindings for the preCICE coupling library"
pkgver=2.3.0.1
pkgrel=1
arch=(x86_64)
url="https://github.com/${_base/py/}/python-bindings"
license=(LGPL3)
depends=(precice python-mpi4py)
makedepends=(python-setuptools cython)
checkdepends=(python-argparse)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0b0447a9cb9989ae5035919439f3e73401dab2a4cda49d298a10f55842c197239c1d43ca6271ddbf5ef03bda4cf075020c18142a6d4c6d26103f75d332cba822')

build() {
  cd "python-bindings-${pkgver}"
  python setup.py clean --all
  python setup.py \
    build_ext \
    --include-dirs=/usr/include \
    --library-dirs=/usr/lib \
    --inplace
}

check() {
  cd "python-bindings-${pkgver}"
  # https://github.com/precice/python-bindings/issues/1
  python setup.py test
}

package() {
  cd "python-bindings-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
