pkgname=libbtbb
pkgver=2018.12.R1
_pkgver=2018-12-R1
pkgrel=1
pkgdesc='Bluetooth baseband decoding library'
url='https://github.com/greatscottgadgets/libbtbb'
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=(cmake)
depends=('python2')
source=("https://github.com/greatscottgadgets/libbtbb/archive/${_pkgver}.tar.gz")
sha256sums=('0eb2b72e1c1131538206f1e3176e2cf1048751fe7dc665eef1e7429d1f2e6225')

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
