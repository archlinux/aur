# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ben Greiner <code@bnavigator.de>
_base=slycot
pkgname="python-${_base}-mkl"
pkgver=0.6.1
pkgrel=1
pkgdesc="A wrapper for the SLICOT control and systems library. Built against Intel MKL"
arch=(i686 x86_64)
url="https://github.com/python-control/${_base}"
license=(GPL-2.0-or-later BSD-3-Clause)
depends=(python-numpy)
makedepends=(python-setuptools-scm python-scikit-build gcc-fortran intel-oneapi-mkl)
provides=("python-${_base}=${pkgver}")
conflicts=("python-${_base}")
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('da5d691d7f78fbdf6cf6ca7cf58a44e4fbeec68c2759f988a1b11ddf4114f989da5d8934c8f18120e24b2ea9bad535c1e6c3c3f3dd6f73948a1afa9bcdc07938')

build() {
  cd ${_base}-${pkgver}
  export MKLROOT=/opt/intel/oneapi/mkl/latest
  python setup.py build -G "Unix Makefiles"
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build -G "Unix Makefiles"
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
