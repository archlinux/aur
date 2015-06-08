pkgname=openmm
pkgver=6.2
pkgrel=1
pkgdesc="Toolkit for molecular simulation using high performance GPU code"
arch=('i686' 'x86_64')
url="https://simtk.org/home/openmm"
license=('MIT' 'LGPL')
depends=('fftw')
makedepends=('cmake' 'swig')
source=("https://github.com/pandegroup/openmm/archive/${pkgver}.tar.gz"
         https://github.com/xantares/openmm/commit/01ae387d649c959812bb3d3bc451e54746b2ab59.patch)
md5sums=('fad92d0a0e7cd1585b35777e98914b8f'
         '21a008fabf6a8fa0611b84d888c6f84b')

prepare() {
  cd "${srcdir}"/openmm-${pkgver}
  patch -p1 -i "${srcdir}"/01ae387d649c959812bb3d3bc451e54746b2ab59.patch
  sed -i "s|sys.argv\[0\]|os.path.basename(sys.argv\[0\])|g" wrappers/python/src/swig_doxygen/swigInputBuilder.py 
}

build() {
  cd "${srcdir}"/openmm-${pkgver}
  mkdir -p build && pushd build
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    ..
  make
}

package() {
  cd "${srcdir}"/openmm-${pkgver}/build
  make DESTDIR="${pkgdir}" install
  install -d "${pkgdir}"/usr/share/licenses/${pkgname}
  mv "${pkgdir}"/usr/licenses/*.txt "${pkgdir}"/usr/share/licenses/${pkgname}
  rm -rf "${pkgdir}"/usr/{bin,docs,examples,licenses}
}
