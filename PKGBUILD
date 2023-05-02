# Contributor: Carlos Aznarán Laos <caznaranl@uni.pe>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_base=pykickstart
pkgbase=python-${_base}
pkgname=(python-${_base} ${_base}-tools)
pkgver=3.32.10
pkgrel=1
pkgdesc="Python module for manipulating kickstart files"
arch=(any)
license=(GPL)
url="http://fedoraproject.org/wiki/Pykickstart"
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("${_base}-${pkgver}.tar.gz::https://github.com/${_base}/${_base}/archive/r${pkgver}.tar.gz")
sha512sums=('55e0dbaa62acb1123eb45ade01c4edc82234162e513755ced6a34efe40c20763c1983eb263ff8b9d50f9c2e46210792b41b338690575654dc77743877928192a')

build() {
  cd ${_base}-r${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package_python-pykickstart() {
  pkgdesc="Python module for manipulating kickstart files"
  depends=(python-requests)

  cd ${_base}-r${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # this is distributed with tools package
  rm -r "${pkgdir}"/usr/{bin,share}
}

package_pykickstart-tools() {
  pkgdesc="tools for reading and writing kickstart files"
  depends=(python-pykickstart)

  cd ${_base}-r${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # this is distributed with libs package
  rm -rf "${pkgdir}"/usr/lib
}
