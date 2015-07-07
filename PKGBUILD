# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=gdcm
pkgver=2.4.4
pkgrel=2
pkgdesc='a C++ library for DICOM medical files'
arch=('i686' 'x86_64')
url='http://gdcm.sourceforge.net'
license=('BSD')
depends=('vtk')
optdepends=('python2: python bindings'
            'java-runtime: java bindings')
makedepends=('cmake' 'swig' 'python2' 'java-environment' 'mono')
source=("http://sourceforge.net/projects/gdcm/files/gdcm%202.x/GDCM%20${pkgver}/gdcm-${pkgver}.tar.bz2")
md5sums=('c1fd2a9595236a03d114370e9c42ef48')

build() {
  cd "$srcdir"

  mkdir -p build && cd build

  cmake \
    -DCMAKE_SKIP_RPATH:BOOL=YES \
    -DCMAKE_INSTALL_PREFIX:FILEPATH=/usr \
    -DGDCM_BUILD_APPLICATIONS:BOOL=ON \
    -DGDCM_BUILD_SHARED_LIBS:BOOL=ON \
    -DGDCM_BUILD_TESTING:BOOL=OFF \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DGDCM_WRAP_PYTHON:BOOL=OFF \
    -DGDCM_WRAP_CSHARP:BOOL=OFF \
    -DGDCM_WRAP_JAVA:BOOL=OFF \
    -DGDCM_USE_VTK:BOOL=ON \
    -DGDCM_USE_SYSTEM_EXPAT:BOOL=ON \
    -DGDCM_USE_SYSTEM_ZLIB:BOOL=ON \
    -DGDCM_USE_SYSTEM_UUID:BOOL=ON \
    -DGDCM_USE_SYSTEM_OPENJPEG:BOOL=OFF \
    -DGDCM_USE_SYSTEM_OPENSSL:BOOL=ON \
    ../$pkgname-$pkgver

    #  binding fail for some reason with new vtk. Will investigate later.
    #
    #-DPYTHON_EXECUTABLE:PATH=/usr/bin/python2 \
    #-DPYTHON_INCLUDE_DIR:PATH=/usr/include/python2.7 \
    #-DPYTHON_LIBRARY:PATH=/usr/lib/libpython2.7.so \
    #-DGDCM_VTK_JAVA_JAR:PATH=/usr/share/java/vtk/vtk.jar \
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  install -Dm644 Copyright.txt "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  cd ../build
  make DESTDIR="$pkgdir" install

  cd "$pkgdir"/usr/lib

  #mkdir -p python2.7/site-packages
  #mv *.py python2.7/site-packages

  #mkdir -p ../share/java/gdcm
  #mv *.jar ../share/java/gdcm
}

