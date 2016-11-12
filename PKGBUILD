# Maintainer: Javier Torres <javitonino [at] gmail [dot] com>

pkgname=python2-kolabformat
pkgver=1.1.6
pkgrel=1
pkgdesc='Python bindings for Kolab XML Format Schema Definitions Library'
url='http://www.kolab.org'
arch=('i686' 'x86_64')
license=('GPL')
depends=('libkolabxml')
makedepends=('cmake' 'boost' 'xsd' 'qt4' 'swig')
source=("http://mirror.kolabsys.com/pub/releases/libkolabxml-${pkgver}.tar.gz")
sha256sums=('e48d7f5de1860a381da27981f6c70de1c9f38c4cd536bc6558b6529ce95f0677')

prepare() {
    mkdir "${srcdir}/build"

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
