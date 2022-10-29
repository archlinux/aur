# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jose Riha <jose1711 gmail com>
_base=outdated
pkgname=python-${_base}
pkgdesc="Check if a version of a PyPI package is outdated"
pkgver=0.2.2
pkgrel=1
arch=(any)
url="https://github.com/alexmojaki/${_base}"
license=(MIT)
depends=(python-requests python-littleutils python-setuptools)
makedepends=(python-setuptools-scm)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('812fe6ce178d0106c1a4a077fa27bef6a1bbeae87d4c6984a88f2aa89926e13a87a5afbfeffc230b0a3456818b25a539fa2665801c037f299d8364e57b999fbf')

build() {
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  cd ${_base}-${pkgver}
  python -c "from setuptools import setup; setup();" build
}

check() {
  cd ${_base}-${pkgver}
  python tests.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -c "from setuptools import setup; setup();" install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
