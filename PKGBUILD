# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - OpenCV 3.x."
url='http://opencv.org'

pkgname='ros-kinetic-opencv3'
pkgver='3.2.0'
_pkgver_patch=4
arch=('any')
pkgrel=7
license=('BSD')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  python2-numpy
  ffmpeg
  libtiff
  libjpeg-turbo
  vtk
  zlib
  v4l-utils
  jasper
  protobuf
  libpng
  python2)

ros_depends=(ros-kinetic-catkin)
depends=(${ros_depends[@]}
  python2-numpy
  protobuf
  libjpeg-turbo
  vtk
  zlib
  jasper
  ffmpeg
  libpng
  python2
  qt5-base
  libxt)

# Git version (e.g. for debugging)
# _tag=release/kinetic/opencv3/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/opencv3-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="opencv3-release-release-kinetic-opencv3-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/opencv3-release/archive/release/kinetic/opencv3/${pkgver}-${_pkgver_patch}.tar.gz"
		cmake_fix.patch)
sha256sums=('2e2e35fe81f5764915ec998eeb1a4fc82053b46862662bf2b291328436653237'
            '1549289a92fff0464bfa343756f15b087e625bdd3e6ac74674a5a75b7a15bfaf')

prepare() {
  cd ${srcdir}
  patch -p1 < cmake_fix.patch
}

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
        -DENABLE_PRECOMPILED_HEADERS=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
