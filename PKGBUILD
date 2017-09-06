pkgname=openmm
pkgver=7.1.1
pkgrel=1
pkgdesc="Toolkit for molecular simulation using high performance GPU code"
arch=('i686' 'x86_64')
url="http://openmm.org/"
license=('MIT' 'LGPL')
depends=('fftw')
makedepends=('cmake' 'swig' 'doxygen')
source=("https://github.com/pandegroup/openmm/archive/${pkgver}.tar.gz")
sha1sums=('c847c6cb654ee9f7dbf16babc1979f4021dc1d69')

#prepare() {
#  cd "${srcdir}"/openmm-${pkgver}
#  patch -p1 -i "${srcdir}"/01ae387d649c959812bb3d3bc451e54746b2ab59.patch
#  sed -i "s|sys.argv\[0\]|os.path.basename(sys.argv\[0\])|g" wrappers/python/src/swig_doxygen/swigInputBuilder.py 
#}

build() {
  cd "${srcdir}"
  mkdir -p build
  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ../openmm-${pkgver}
  make
}
check () {
  msg2 "Testing openmm"
  cd "${srcdir}"/build
#  make test
}


package() {
  cd "${srcdir}"/build
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" PythonInstall
  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  mv "${pkgdir}"/usr/licenses/*.txt "${pkgdir}"/usr/share/licenses/${pkgname}
  rm -rf "${pkgdir}"/usr/{bin,docs,examples,licenses}
}
