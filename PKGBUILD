# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - OpenCV 3.x. for melodic distro"

_pkgname="opencv"
pkgname='ros-melodic-opencv3'
pkgver='3.4.7'
_pkgver_patch=1
arch=('x86_64')
pkgrel=2
license=('BSD')
url='https://github.com/ros-gbp/opencv3-release'
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
  'python'
  'python-numpy'
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
  'python'
  'v4l-utils'
  'zlib')

source=(opencv-${pkgver}.tar.gz::https://github.com/opencv/opencv/archive/${pkgver}.tar.gz
        opencv_contrib-${pkgver}.tar.gz::https://github.com/opencv/opencv_contrib/archive/${pkgver}.tar.gz)
sha256sums=('ea743896a604a6ba1e1c1651ad42c97d0f90165debe9940811c7e0bdaa307526'
            '5e3ba5fbe0ff3ab7462d42c08501f8c15d3e46b0684aee281f735345e1353cb4')

_dir="opencv-${pkgver}"

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCATKIN_BUILD_BINARY_PACKAGE=ON \
    -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
    -DPYTHON_EXECUTABLE=/usr/bin/python3 \
    -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
    -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
    -DPYTHON_BASENAME=.cpython3.7m \
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
    -DLAPACK_LAPACKE_H="/usr/include/lapacke.h" \
    -DENABLE_PRECOMPILED_HEADERS=OFF

  ##########################################
  # Temporary workaround until compiler issue is fixed
  ##########################################
  # assume gcc compiler, fix issue:
  #    /usr/include/c++/9.2.0/cstdlib:75:15: fatal error: stdlib.h: No such file or directory

  CXX_VERSION=$(gcc --version | head -n1 | cut -f3 -d' ')
  echo "GCC vession found: ${CXX_VERSION}"
  # patch makefiles to insert gcc std include first all other includes
  grep -Rl CXX_INCLUDES "${srcdir}/build" | while read MAKE; do
    echo "patching ${MAKE}..."
    sed -i "s|CXX_INCLUDES = -I|CXX_INCLUDES = -isystem /usr/include/c++/${CXX_VERSION} -I|" "${MAKE}"
  done
  ##########################################

  # use all processors but be nice
  nice make -j$(nproc)
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
