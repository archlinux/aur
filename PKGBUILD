# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pooch
pkgname=pypy3-${_base}
pkgdesc="A friend to fetch your data files"
pkgver=1.9.0
pkgrel=1
arch=(any)
url="https://github.com/fatiando/${_base}"
license=(BSD-3-Clause)
depends=(pypy3-platformdirs pypy3-packaging pypy3-requests)
makedepends=(pypy3-build pypy3-installer pypy3-setuptools-scm)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  fixwheel.patch::${url}/commit/96bd5437.patch)
sha512sums=('5e66990f0d7b23e0d5e5e680f70bf735265af4372080b9143af5b9f1e54af088975fd387271554110de4573729ae66e4417210f1ccc2f68785bbfbdf9284c6da'
            'b375a82c7737bf9ed779ee20656c99d198886b034f7cf124d97bac2fd822fc942ab2d05867146a7aa9a74e7e51643fa14cf048e43e7645d908236e9df49d5d05')

prepare() {
  cd ${_base}-${pkgver}
  patch -p1 -i ../fixwheel.patch # Exclude doc dir from wheel
}

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  pypy3 -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" pypy3 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
