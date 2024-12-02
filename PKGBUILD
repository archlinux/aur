pkgname=openmm
pkgver=8.2.0
pkgrel=1
pkgdesc="Toolkit for molecular simulation using high performance GPU code"
arch=('x86_64')
url="http://openmm.org/"
license=('MIT' 'LGPL')
depends=('fftw')
optdepends=('cuda: prrovides cuda support')
makedepends=('cmake' 'swig' 'doxygen' 'cython')
source=("https://github.com/pandegroup/openmm/archive/${pkgver}.tar.gz")
sha256sums=('61bc7b9254c603de1eb3274f0007725331f10b74d0442facb80be3d468ad5977')

#export CC=gcc-13
#export CXX=g++-13
#export FC=gfortran-13

build() {
  cd "${srcdir}"
  mkdir -p build
  cd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DOPENMM_GENERATE_API_DOCS=ON \
    ../openmm-${pkgver}
  make
}
check () {
  msg2 "Testing openmm"
  cd "${srcdir}"/build
  #make test
}


package() {
  cd "${srcdir}"/build
  msg2 "Installing openmm"
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}"/usr/share/licenses/${pkgname}

  msg2 "Installing openmm python bindings"
  # Fix to install python wrapper
  sed -i 's:ENV{OPENMM_LIB_PATH} ":ENV{OPENMM_LIB_PATH} "$ENV{DESTDIR}:g' wrappers/python/pysetupinstall.cmake
  make DESTDIR="${pkgdir}" PythonInstall
  mv "${pkgdir}"/usr/licenses/*.txt "${pkgdir}"/usr/share/licenses/${pkgname}
  rm -rf "${pkgdir}"/usr/{bin,docs,examples,licenses}
}
