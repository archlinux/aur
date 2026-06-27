# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ben Greiner <code@bnavigator.de>
_base=slycot
pkgname="python-${_base}-mkl"
pkgver=0.7.0
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
sha512sums=('174bf0a0285b66f24b7b20d5dbe24a22aa82015324195a8ef392bc55583876e260d570f46d76b234c97d2b04090f2df8b38b81d31b830bc1954ff392e2f5f629')

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
