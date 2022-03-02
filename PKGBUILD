# Maintainer: DanielNak <daniel@tee.cat>

pkgname=ros-noetic-mbf-abstract-core
pkgver=0.3.4
pkgdesc="ROS - This package provides common interfaces for navigation specific robot actions."
url='http://wiki.ros.org/mbf_abstract_core'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
  ros-noetic-std-msgs
  ros-noetic-geometry-msgs
  ros-noetic-catkin
)

makedepends=(
  'cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-noetic-std-msgs
  ros-noetic-geometry-msgs
)

depends=(
  ${ros_depends[@]}
)

# Tarball version (faster download)
_dir="move_base_flex-release-release-noetic-mbf_abstract_core"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/uos-gbp/move_base_flex-release/archive/release/noetic/mbf_abstract_core/${pkgver}.tar.gz")
sha256sums=('ecb88ffe26600b0f94f037512ad4c954465ae13492da4c3463c5e4c7007b84bd')

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

