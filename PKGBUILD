# Maintainer: DanielNak <daniel@tee.cat>

pkgname=ros-noetic-mbf-utility
pkgver=0.3.4
pkgdesc="ROS - The mbf_utility package."
url='http://wiki.ros.org/move_base_flex/mbf_utility'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
  ros-noetic-tf
  ros-noetic-tf2-geometry-msgs
  ros-noetic-roscpp
  ros-noetic-tf2-ros
  ros-noetic-tf2
  ros-noetic-geometry-msgs
  ros-noetic-catkin
)

makedepends=(
  'cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-noetic-tf
  ros-noetic-tf2-geometry-msgs
  ros-noetic-roscpp
  ros-noetic-tf2-ros
  ros-noetic-tf2
  ros-noetic-geometry-msgs
)

depends=(
  ${ros_depends[@]}
)

# Tarball version (faster download)
_dir="move_base_flex-release-release-noetic-mbf_utility"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/uos-gbp/move_base_flex-release/archive/release/noetic/mbf_utility/${pkgver}.tar.gz")
sha256sums=('ba73e07835df8cbc310e41dd223e572c1babb1b18edbf923b508f8f795ceb79a')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Build project
  cmake ${srcdir}/${_dir} \
    -DCATKIN_BUILD_BINARY_PACKAGE=ON \
    -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
    -DPYTHON_EXECUTABLE=/usr/bin/python \
    -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
