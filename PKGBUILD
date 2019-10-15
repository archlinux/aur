# Maintainer: Kevin Slagle <kjslag at gmail dot com>

pkgname=regina-normal
pkgver=5.1
pkgrel=1
pkgdesc='software for low-dimensional topology'
arch=('x86_64')
url='https://regina-normal.github.io/'
license=('GPL')
# hicolor-icon-theme desktop-file-utils were suggested by namcap
depends=(gmp libxml2 jansson tokyocabinet popt boost qt5-svg python2 hicolor-icon-theme desktop-file-utils)
optdepends=('doxygen: C++/Python API docs'
            'graphviz: drawing graphs'
            'libxslt: user handbook'
            'openmpi: MPI-enabled utilities'
            'cppunit: test suite')
source=("https://github.com/regina-normal/regina/releases/download/regina-$pkgver/regina-$pkgver.tar.gz")
md5sums=('76ea01d700618325c3f0cbaa6acff159')

prepare() {
    cd "regina-$pkgver"
    
    # add a missing header file to fix a compile error
    sed -i '45i#include <functional>' engine/triangulation/dim3/triangulation3.h
}

build() {
    cd "regina-$pkgver"
    mkdir build
    cd build
    
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DPYTHON_EXECUTABLE=/bin/python2 -DBoost_PYTHON_VERSION=2.7 ..
    make
}

package() {
    cd "regina-$pkgver/build"
    make DESTDIR="$pkgdir/" install
    
    # regina-python seems to assume that the build directory will still be around after the install.
    # Since the build directory is temporary, we copy the engine source files to usr/share/regina/ (since regina-python also makes use of /usr/share/regina/examples/) and update the regina-python to use this location.
    cp -R ../engine $pkgdir/usr/share/regina/
    sed -i "s|my \$srcdir = \".*src/regina-$pkgver\";|my \$srcdir = \"/usr/share/regina/\";|" $pkgdir/usr/bin/regina-python
}
