pkgname=libbtbb
pkgver=2020.12.R1
_pkgver=2020-12-R1
pkgrel=1
pkgdesc='Bluetooth baseband decoding library'
url='https://github.com/greatscottgadgets/libbtbb'
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=(cmake)
depends=('python2')
source=("https://github.com/greatscottgadgets/libbtbb/archive/${_pkgver}.tar.gz")
sha256sums=('9478bb51a38222921b5b1d7accce86acd98ed37dbccb068b38d60efa64c5231f')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}/"
  sed -i -r -e "s#@CMAKE_INSTALL_PREFIX@#/usr#" lib/libbtbb.pc.in
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr -DENABLE_PYTHON=FALSE ..
  make
  cd ../python/pcaptools
  sed -i -r -e "s/python/python2/" btaptap
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}/build/"
  make install
  cd ../python/pcaptools
  mkdir -p ${pkgdir}/usr/bin
  cp btaptap ${pkgdir}/usr/bin/
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
