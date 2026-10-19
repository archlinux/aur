# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ben Greiner <code@bnavigator.de>
_base=slycot
pkgname="python-${_base}-mkl"
pkgver=0.7.1
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
sha512sums=('083dbc7510b7e0c8dd7918220b06632149aaaae80584373f3907f23a829f87b4e8bd97fbdd3de74804054d2206f4386997a6eec406d27b102251ec69639f9b63')

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
