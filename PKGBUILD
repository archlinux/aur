# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - MoveIt interface to OMPL."
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit-planners-ompl'
pkgver='1.0.7'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-moveit-core
  ros-melodic-tf
  ros-melodic-pluginlib
  ros-melodic-roscpp
  ros-melodic-dynamic-reconfigure
  ros-melodic-moveit-ros-planning
  ros-melodic-eigen-conversions
  ros-melodic-moveit-resources
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools' 'ompl'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-moveit-core
  ros-melodic-tf
  ros-melodic-pluginlib
  ros-melodic-roscpp
  ros-melodic-dynamic-reconfigure
  ros-melodic-moveit-ros-planning
  ros-melodic-eigen-conversions)
depends=('ompl' ${ros_depends[@]})

_dir="moveit-${pkgver}/moveit_planners/ompl"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz")
sha256sums=('388a15209a0191bcdc8a1a9e6b3eaca4717aaa3a6fb9f541ad31dff7c3d6d07a')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
