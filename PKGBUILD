# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkg=abydos
pkgname=python-${_pkg,,}
pkgver=0.5.0
pkgrel=5
pkgdesc="NLP/IR library for Python"
arch=(any)
url="https://github.com/chrislit/abydos"
license=(GPL3)
depends=(python-numpy)
makedepends=(python-setuptools)
checkdepends=(
    python-pytest
    python-deprecation
    python-nltk
)
# No tests in PyPi tarballs
#source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
source=(${url}/archive/v${pkgver}/${_pkg}-${pkgver}.tar.gz
        python310.patch)
sha256sums=('0d46be1a40cfcdcd9ff9d052828c6ea57f5e1e2378373761c963c4a0cfcc5512'
            '33d7c2d13f7e87c33c6f92caf934b6eb10b9503b1334068aee7b4de6bc2660e3')

prepare() {
  cd ${_pkg}-${pkgver}
  patch -Np1 -i ../python310.patch
  find -name '*.py' -exec sed -e 's|from numpy import float |from numpy import float_ |g' \
                              -e 's|numpy import int |numpy import int_ |g' \
                              -e 's|dtype=np\.bool)|dtype=np.bool_)|g' \
                              -e 's|dtype=np\.float)|dtype=np.float_)|g' -i {} \;
}

build() {
  cd ${_pkg}-${pkgver}
  python setup.py build
}

check() {
  cd ${_pkg}-${pkgver}
  rm setup.cfg
  pytest
}

package() {
  cd ${_pkg}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
}
