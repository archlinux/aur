# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Components of MoveIt that offer simpler interfaces to planning and execution."
url='https://moveit.ros.org'

pkgname='ros-noetic-moveit-ros-planning-interface'
pkgver='1.0.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-noetic-tf-conversions
  ros-noetic-tf
  ros-noetic-moveit-ros-move-group
  ros-noetic-moveit-ros-warehouse
  ros-noetic-rospy
  ros-noetic-roscpp
  ros-noetic-moveit-ros-planning
  ros-noetic-actionlib
  ros-noetic-eigen-conversions
  ros-noetic-moveit-ros-manipulation
  ros-noetic-rosconsole
  ros-noetic-moveit-resources
  ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  python
  python-catkin-pkg
  eigen)

ros_depends=(ros-noetic-tf-conversions
  ros-noetic-tf
  ros-noetic-moveit-ros-move-group
  ros-noetic-moveit-ros-warehouse
  ros-noetic-rospy
  ros-noetic-roscpp
  ros-noetic-moveit-ros-planning
  ros-noetic-actionlib
  ros-noetic-eigen-conversions
  ros-noetic-moveit-ros-manipulation
  ros-noetic-rosconsole)
depends=(${ros_depends[@]}
  python
  eigenpy)

# Git version (e.g. for debugging)
# _tag=release/noetic/moveit_ros_planning_interface/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('6cbf0b256af768dcd336ff60b142a2f1d363c79879c30bbe5bc0952c0375b2e8')

# Tarball version (faster download)
_dir="moveit-${pkgver}/moveit_ros/planning_interface"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz"
  "eigenpy.patch")
sha256sums=('b8194308c57dbe34bbb729cfccb30d1113af3a54a90a2cfb49482142d1044ea4'
  '797e2415ec9c66b2f7137bb6c0037e4f0ef5520baba7eff3af3eb04119e42b40')

prepare() {
  cd ${srcdir}/${_dir}
  patch -uN CMakeLists.txt ${srcdir}/eigenpy.patch || return 1

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
