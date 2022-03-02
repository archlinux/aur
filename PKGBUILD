# Maintainer: DanielNak <daniel@tee.cat>

pkgname=ros-noetic-mbf-msgs
pkgver=0.3.4
pkgdesc="ROS - Provides action definition files for GetPath, ExePath, Recovery and MoveBase."
url='http://wiki.ros.org/mbf_msgs'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
  ros-noetic-message-generation
  ros-noetic-nav-msgs
  ros-noetic-message-runtime
  ros-noetic-genmsg
  ros-noetic-geometry-msgs
  ros-noetic-std-msgs
  ros-noetic-actionlib-msgs
  ros-noetic-catkin
)

makedepends=(
  'cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-noetic-nav-msgs
  ros-noetic-message-runtime
  ros-noetic-geometry-msgs
  ros-noetic-std-msgs
  ros-noetic-actionlib-msgs
)

depends=(${ros_depends[@]})

# Tarball version (faster download)
_dir="move_base_flex-release-release-noetic-mbf_msgs"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/uos-gbp/move_base_flex-release/archive/release/noetic/mbf_msgs/${pkgver}.tar.gz")
sha256sums=('a97ef5748d93f9916ec8aa5884123d3c3c51a4fcdf255ec1efb15eaa92c00558')

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
