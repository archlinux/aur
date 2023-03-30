pkgname=salome-medcoupling
pkgver=9.10.0
pkgrel=1
pkgdesc="Field data manipulation library"
url="https://www.salome-platform.org"
license=('LGPL2+')
depends=('med' 'libxml2' 'python-scipy' 'metis') #'scotch' 
makedepends=('swig' 'salome-configuration')
arch=('x86_64')
source=("git+https://git.salome-platform.org/gitpub/tools/medcoupling.git#tag=V9_10_0")
md5sums=(SKIP)

prepare () {
  cd medcoupling
  sed -i "s|FIND_PACKAGE(SalomeHDF5 REQUIRED)|find_package(HDF5 REQUIRED)|g" CMakeLists.txt
}

build() {
  cmake -S medcoupling -B build \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
    -DCONFIGURATION_ROOT_DIR=/usr/share/salome/configuration -DSALOME_USE_MPI=ON \
    -DMEDCOUPLING_BUILD_DOC=OFF -DMEDCOUPLING_BUILD_TESTS=OFF \
    -DMEDCOUPLING_PARTITIONER_METIS:BOOL=ON -DMEDCOUPLING_PARTITIONER_PARMETIS:BOOL=ON \
    -DMEDCOUPLING_PARTITIONER_SCOTCH=OFF
   make -C build
}
 
package() {
  make DESTDIR=${pkgdir} install -C build
}
