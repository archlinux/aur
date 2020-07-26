# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-cipheycore
_pkgname=CipheyCore
pkgver=0.2.4
pkgrel=1
pkgdesc="Some cryptanalysis tidbits written in a proper language"
arch=("any")
url="https://github.com/Ciphey/CipheyCore"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-poetry' 'boost' 'swig' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('3a9ac1d8abb5d3cb494a7fac1e7cdc67e42adfe65503e942653fbfc8880cd903')

build() {
  cd ${_pkgname}-${pkgver}
  mkdir build && cd build
  cmake .. -DCIPHEY_CORE_TEST=OFF -DCMAKE_BUILD_TYPE=Release
  cmake --build .
  python -m poetry build
  cd dist
  tar xf cipheycore-${pkgver}.tar.gz
  cd cipheycore-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}/build/dist/cipheycore-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
