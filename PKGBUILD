# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Holds the action description and relevant messages for the move_base package."
url='https://wiki.ros.org/move_base_msgs'

pkgname='ros-noetic-move-base-msgs'
pkgver='1.14.1'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-noetic-message-generation
  ros-noetic-actionlib-msgs
  ros-noetic-geometry-msgs
  ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-message-runtime
  ros-noetic-actionlib-msgs
  ros-noetic-geometry-msgs)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/noetic/move_base_msgs/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/navigation_msgs-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="navigation_msgs-${pkgver}/move_base_msgs"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/navigation_msgs/archive/${pkgver}.tar.gz")
sha256sums=('897e2809fa07330f3b01fbd99163dbed5669eec89d4b7fd742d62cf57b690149')

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
