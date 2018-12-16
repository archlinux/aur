# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
# Official Maintainer: Ray Rashif <schiv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

# Based on the official opencv PKGBUILD
pkgname=opencv-java
_pkgbase=opencv
pkgver=4.0.0
pkgrel=1
pkgdesc="Open Source Computer Vision Library - Java bindings"
arch=(i686 x86_64)
license=(BSD)
url="http://opencv.org/"
depends=("opencv>=$pkgver" java-runtime)
# Last two makedepends are needed for the Java binding
makedepends=(cmake python-numpy python2-numpy mesa eigen apache-ant java-environment)
optdepends=('opencv-samples: OpenCV samples')
source=("$_pkgbase-$pkgver.tar.gz::https://github.com/opencv/opencv/archive/$pkgver.tar.gz"
        "opencv_contrib-$pkgver.tar.gz::https://github.com/opencv/opencv_contrib/archive/$pkgver.tar.gz")
sha256sums=('3787b3cc7b21bba1441819cb00c636911a846c0392ddf6211d398040a1e4886c'
            '4fb0681414df4baedce6e3f4a01318d6f4fcde6ee14854d761fd4e397a397763')
# Removed all the CMake flags manipulation;
# hopefully, SSE will be automagically disabled properly on i686

prepare() {
  # Setting JAVA_HOME
  msg2 "Setting JAVA_HOME variable"
  export JAVA_HOME="/usr/lib/jvm/default"
  mkdir -p build
}

build() {
  cd build
  # The flags are almost as the original package, just tweaked for easier and speedier builds
  cmake ../$_pkgbase-$pkgver \
    -DBUILD_LIST=java \
    -DWITH_OPENCL=ON \
    -DWITH_OPENGL=ON \
    -DWITH_TBB=ON \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DBUILD_WITH_DEBUG_INFO=OFF \
    -DBUILD_TESTS=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DOPENCV_EXTRA_MODULES_PATH="$srcdir/opencv_contrib-$pkgver/modules" \
    -DLAPACK_LIBRARIES="/usr/lib/liblapack.so;/usr/lib/libblas.so;/usr/lib/libcblas.so" \
    -DLAPACK_CBLAS_H="/usr/include/cblas.h" \
    -DLAPACK_LAPACKE_H="/usr/include/lapacke.h"
  make
}

# Changed in order to save just Java files
# It's a bit dirty, but it works
package() {
  cd build

  msg2 "Making a fake install ..."
  mkdir -p "$srcdir/temp"
  make DESTDIR="$srcdir/temp" install

  msg2 "Adjusting stuff ..."
  _opencv_java="usr/share/java/opencv4"
  # Creating the package structure
  mkdir -p "$pkgdir/$_opencv_java"
  # Installing the built files
  cp -rv "$srcdir/temp/$_opencv_java" "$pkgdir/usr/share/java"

  # Create a symbolic link in /usr/share/java as Java apps written for Ubuntu may be looking there
  mkdir -p "$pkgdir/usr/share/java/"
  ln -sv "/$_opencv_java/opencv-${pkgver//./}.jar" "$pkgdir/usr/share/java/opencv.jar"
  mkdir -p "$pkgdir/usr/lib/"
  ln -sv "/$_opencv_java/libopencv_java${pkgver//./}.so" "$pkgdir/usr/lib/libopencv_java.so"
}
