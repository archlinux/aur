# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Components of MoveIt that offer simpler interfaces to planning and execution."
url='http://moveit.ros.org'

pkgname='ros-kinetic-moveit-ros-planning-interface'
pkgver='0.9.11'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-tf-conversions
  ros-kinetic-tf
  ros-kinetic-moveit-ros-move-group
  ros-kinetic-moveit-ros-warehouse
  ros-kinetic-rospy
  ros-kinetic-roscpp
  ros-kinetic-moveit-ros-planning
  ros-kinetic-actionlib
  ros-kinetic-eigen-conversions
  ros-kinetic-moveit-ros-manipulation
  ros-kinetic-rosconsole
  ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  python2
  python2-catkin-pkg
  eigen)

ros_depends=(ros-kinetic-tf-conversions
  ros-kinetic-tf
  ros-kinetic-moveit-ros-move-group
  ros-kinetic-moveit-ros-warehouse
  ros-kinetic-rospy
  ros-kinetic-roscpp
  ros-kinetic-moveit-ros-planning
  ros-kinetic-actionlib
  ros-kinetic-eigen-conversions
  ros-kinetic-moveit-ros-manipulation
  ros-kinetic-rosconsole)
depends=(${ros_depends[@]}
  python2)

# Git version (e.g. for debugging)
# _tag=release/kinetic/moveit_ros_planning_interface/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="moveit-release-release-kinetic-moveit_ros_planning_interface-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/moveit-release/archive/release/kinetic/moveit_ros_planning_interface/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('c6bb07307640514920fee79e24986d40bdbc85bc1a469d0560d318fea6b061c3')

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
