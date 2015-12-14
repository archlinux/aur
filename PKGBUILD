# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=python2-kolabformat
pkgver=1.1.2
pkgrel=1
pkgdesc='Python bindings for Kolab XML Format Schema Definitions Library'
url='http://www.kolab.org'
arch=('i686' 'x86_64')
license=('GPL')
depends=('libkolabxml')
makedepends=('cmake' 'boost' 'xsd' 'qt4' 'swig')
source=("http://mirror.kolabsys.com/pub/releases/libkolabxml-${pkgver}.tar.gz")
sha256sums=('1de632572da1421c0e4b580cba763932bc943d457743abc7fb836e6200861fac')

prepare() {
    mkdir build

    # Patch CMake to use python2
    sed "s/find_package(PythonLibs REQUIRED)/find_package(PythonLibs 2.7 REQUIRED)/g" -i "${srcdir}/libkolabxml-${pkgver}/src/python/CMakeLists.txt"  
}

build() {
    cd "${srcdir}/build"
    cmake ../libkolabxml-${pkgver} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTS=OFF \
        -DPYTHON_BINDINGS=true \
        -DPYTHON_INSTALL_DIR=$(python2 -c 'import site; print site.getsitepackages()[0]')
    make
}

package() {
    cd "${srcdir}/build/src/python"
    make DESTDIR="${pkgdir}" install
}
