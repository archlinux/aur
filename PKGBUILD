# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Components of MoveIt that offer simpler interfaces to planning and execution."
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit-ros-planning-interface'
pkgver='0.10.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-tf-conversions
  ros-melodic-tf
  ros-melodic-moveit-ros-move-group
  ros-melodic-moveit-ros-warehouse
  ros-melodic-rospy
  ros-melodic-roscpp
  ros-melodic-moveit-ros-planning
  ros-melodic-actionlib
  ros-melodic-eigen-conversions
  ros-melodic-moveit-ros-manipulation
  ros-melodic-rosconsole
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  python
  python-catkin-pkg
  eigen)

ros_depends=(ros-melodic-tf-conversions
  ros-melodic-tf
  ros-melodic-moveit-ros-move-group
  ros-melodic-moveit-ros-warehouse
  ros-melodic-rospy
  ros-melodic-roscpp
  ros-melodic-moveit-ros-planning
  ros-melodic-actionlib
  ros-melodic-eigen-conversions
  ros-melodic-moveit-ros-manipulation
  ros-melodic-rosconsole)
depends=(${ros_depends[@]}
  python)

# Git version (e.g. for debugging)
# _tag=release/melodic/moveit_ros_planning_interface/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('6cbf0b256af768dcd336ff60b142a2f1d363c79879c30bbe5bc0952c0375b2e8')

# Tarball version (faster download)
_dir="moveit-release-release-melodic-moveit_ros_planning_interface-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/moveit-release/archive/release/melodic/moveit_ros_planning_interface/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('748d5e2ca554190c84b0e43be8aa44c9b76c5e2a77e9d87eac5619147604a174')

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
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
        -DPYTHON_BASENAME=-python3.7m \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
