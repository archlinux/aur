# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - OpenCV 3.x. for melodic distro"
url='https://github.com/ros-gbp/opencv3-release'

pkgname='ros-melodic-opencv3'
pkgver='3.4.5'
_pkgver_patch=1
arch=('x86_64')
pkgrel=1
license=('BSD')
url="http://opencv.org/"

ros_makedepends=()
makedepends=(
  'cmake'
  'ros-build-tools'
  ${ros_makedepends[@]}
  'eigen'
  'ffmpeg'
  'glew'
  'gtk3'
  'hdf5'
  'jasper'
  'lapacke'
  'libjpeg-turbo'
  'libpng'
  'libtiff'
  'libwebp'
  'mesa'
  'openblas'
  'protobuf'
  'python-setuptools'
  'python2'
  'python2-numpy'
  'v4l-utils'
  'vtk')

ros_depends=('ros-melodic-catkin')
depends=(
  ${ros_depends[@]}
  'ffmpeg'
  'gst-plugins-base'
  'intel-tbb'
  'jasper'
  'lapack'
  'libdc1394'
  'libgphoto2'
  'libjpeg-turbo'
  'libwebp'
  'openblas'
  'openexr'
  'protobuf'
  'python2'
  'v4l-utils'
  'zlib')

source=(opencv-${pkgver}.tar.gz::https://github.com/opencv/opencv/archive/${pkgver}.tar.gz
        opencv_contrib-${pkgver}.tar.gz::https://github.com/opencv/opencv_contrib/archive/${pkgver}.tar.gz)

_dir="opencv-${pkgver}"
sha256sums=('0c57d9dd6d30cbffe68a09b03f4bebe773ee44dc8ff5cd6eaeb7f4d5ef3b428e'
            '8f73d029887c726fed89c69a2b0fcb1d098099fcd81c1070e1af3b452669fbe2')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCATKIN_BUILD_BINARY_PACKAGE=ON \
    -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
    -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
    -DPYTHON_BASENAME=-python2.7 \
    -DSETUPTOOLS_DEB_LAYOUT=OFF \
    -DWITH_V4L=ON \
    -DWITH_LIBV4L=ON \
    -DWITH_FFMPEG=ON \
    -DOPENCV_EXTRA_MODULES_PATH=${srcdir}/opencv_contrib-${pkgver}/modules \
    -DWITH_OPENCL=ON \
    -DWITH_OPENGL=ON \
    -DWITH_TBB=ON \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DBUILD_WITH_DEBUG_INFO=OFF \
    -DBUILD_TESTS=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DINSTALL_C_EXAMPLES=ON \
    -DINSTALL_PYTHON_EXAMPLES=ON \
    -DCPU_BASELINE_DISABLE=SSE3 \
    -DCPU_BASELINE_REQUIRE=SSE2 \
    -DLAPACK_LIBRARIES="/usr/lib/liblapack.so;/usr/lib/libblas.so;/usr/lib/libcblas.so" \
    -DLAPACK_CBLAS_H="/usr/include/cblas.h" \
    -DLAPACK_LAPACKE_H="/usr/include/lapacke.h"

  make -j$(nproc)
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
