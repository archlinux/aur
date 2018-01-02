# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - OpenCV 3.x."
url='http://opencv.org'

pkgname='ros-kinetic-opencv3'
pkgver='3.3.1'
_pkgver_patch=0
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  v4l-utils
  ffmpeg
  libjpeg-turbo
  vtk
  zlib
  python2-numpy
  python2
  libtiff
  protobuf
  libpng
  jasper)

ros_depends=(ros-kinetic-catkin)
depends=(${ros_depends[@]}
  protobuf
  libjpeg-turbo
  vtk
  zlib
  python2-numpy
  python2
  jasper
  libpng
  ffmpeg
  libharu)
conflicts=(lapacke)

# Git version (e.g. for debugging)
# _tag=release/kinetic/opencv3/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/opencv3-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="opencv3-release-release-kinetic-opencv3-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/opencv3-release/archive/release/kinetic/opencv3/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('103f28d76c6451d2371a09fb693f0c466da6dfaf374a4fa92f7dac2ad5a7f4ab')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/kinetic/setup.bash ] && source /opt/ros/kinetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/kinetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
