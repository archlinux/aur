# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - MoveIt interface to OMPL."
url='https://moveit.ros.org'

pkgname='ros-noetic-moveit-planners-ompl'
pkgver='1.0.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=4
license=('BSD')

ros_makedepends=(ros-noetic-moveit-core
  ros-noetic-tf
  ros-noetic-pluginlib
  ros-noetic-roscpp
  ros-noetic-dynamic-reconfigure
  ros-noetic-moveit-ros-planning
  ros-noetic-eigen-conversions
  ros-noetic-moveit-resources
  ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools' 'ompl'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-moveit-core
  ros-noetic-tf
  ros-noetic-pluginlib
  ros-noetic-roscpp
  ros-noetic-dynamic-reconfigure
  ros-noetic-moveit-ros-planning
  ros-noetic-eigen-conversions)
depends=('ompl' ${ros_depends[@]})

_dir="moveit-${pkgver}/moveit_planners/ompl"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz")
sha256sums=('b8194308c57dbe34bbb729cfccb30d1113af3a54a90a2cfb49482142d1044ea4')

prepare() {
  cd ${srcdir}
  find . \( -iname *.cpp -o -iname *.h \) \
      -exec sed -r -i "s/[^_]logError/CONSOLE_BRIDGE_logError/" {} \; \
      -exec sed -r -i "s/[^_]logWarn/CONSOLE_BRIDGE_logWarn/" {} \; \
      -exec sed -r -i "s/[^_]logDebug/CONSOLE_BRIDGE_logDebug/" {} \; \
      -exec sed -r -i "s/[^_]logInform/CONSOLE_BRIDGE_logInform/" {} \;
}

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
