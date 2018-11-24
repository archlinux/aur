pkgname=libbtbb
pkgver=2018.08.R1
pkgrel=1
pkgdesc='Bluetooth baseband decoding library'
url='https://github.com/greatscottgadgets/libbtbb'
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=(cmake)
depends=('python2')
source=("https://github.com/greatscottgadgets/libbtbb/archive/2018-08-R1.tar.gz")
md5sums=('58012533bc30107864a5209d7ccf800d')

build() {
  cd "${srcdir}/${pkgname}-2018-08-R1/"
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
  cd "${srcdir}/${pkgname}-2018-08-R1/build/"
  make install
  cd ../python/pcaptools
  mkdir -p ${pkgdir}/usr/bin
  cp btaptap ${pkgdir}/usr/bin/
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
