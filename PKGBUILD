# Maintainer: orumin <dev at orum.in>

pkgname=lib32-opencv
_basename=opencv
pkgver=3.2.0
pkgrel=1
pkgdesc="Open Source Computer Vision Library (32-bit)"
arch=('x86_64')
license=('BSD')
url="http://opencv.org/"
depends=('lib32-intel-tbb' 'lib32-openexr' 'lib32-xine-lib' 'lib32-libdc1394' 'lib32-gtkglext' 'opencv')
makedepends=('cmake' 'lib32-mesa' 'eigen' 'lib32-hdf5' 'lib32-jasper' 'lib32-libgphoto2')
options=('staticlibs')
optdepends=('opencv-samples'
            'hdf5: support for HDF5 format'
            'opencl-icd-loader: For coding with OpenCL')
source=("$_basename-$pkgver.tar.gz::https://github.com/Itseez/opencv/archive/$pkgver.zip"
        "opencv_contrib-$pkgver.tar.gz::https://github.com/Itseez/opencv_contrib/archive/$pkgver.tar.gz")
md5sums=('bfc6a261eb069b709bcfe7e363ef5899'
         'd7d50c70c31df3b31310f548f31fd2a2')

_cmakeopts=('-D WITH_OPENCL=ON'
            '-D WITH_OPENGL=ON'
            '-D WITH_TBB=ON'
            '-D WITH_XINE=ON'
            '-D WITH_GSTREAMER=OFF'
            '-D BUILD_WITH_DEBUG_INFO=OFF'
            '-D BUILD_TESTS=OFF'
            '-D BUILD_PERF_TESTS=OFF'
            '-D BUILD_EXAMPLES=OFF'
            '-D BUILD_opencv_python2=OFF'
            '-D BUILD_opencv_python3=OFF'
            '-D INSTALL_C_EXAMPLES=OFF'
            '-D INSTALL_PYTHON_EXAMPLES=OFF'
            '-D CMAKE_BUILD_TYPE=Release'
            '-D CMAKE_INSTALL_PREFIX=/usr'
            '-D CMAKE_SKIP_RPATH=ON'
            '-D CMAKE_INSTALL_LIBDIR=lib32'
            '-D CMAKE_C_FLAGS=-m32'
            '-D CMAKE_CXX_FLAGS=-m32'
            '-D CMAKE_LINKER_FLAGS=-m32'
            #'-D WITH_IPP=ON'
            #'-D INSTALL_CREATE_DISTRIB=ON'
            )

build() {
  cd "$srcdir/$_basename-$pkgver"

  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export PYTHON='/usr/bin/python2-32'
  export PYTHON_CONFIG='/usr/bin/python2-32-config'

  cmake ${_cmakeopts[@]} \
    -DOPENCV_EXTRA_MODULES_PATH="$srcdir/opencv_contrib-$pkgver/modules" \
    .

  make
}

package() {
  cd "$srcdir/$_basename-$pkgver"

  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/lib "$pkgdir"/usr/lib32
  rm -r "$pkgdir"/usr/bin
  rm -r "$pkgdir"/usr/include
  rm -r "$pkgdir"/usr/share
}

# vim:set ts=2 sw=2 et:
