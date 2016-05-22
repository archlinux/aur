# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - ROS communications-related packages, including core client libraries (roscpp, rospy) and graph introspection tools (rostopic, rosnode, rosservice, rosparam)."
url='http://www.ros.org/wiki/ros_comm'

pkgname='ros-jade-ros-comm'
pkgver='1.11.19'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-jade-rosgraph-msgs
  ros-jade-rostest
  ros-jade-roscpp
  ros-jade-roswtf
  ros-jade-message-filters
  ros-jade-rosout
  ros-jade-rosservice
  ros-jade-rospy
  ros-jade-rosmaster
  ros-jade-rostopic
  ros-jade-rosnode
  ros-jade-xmlrpcpp
  ros-jade-std-srvs
  ros-jade-rosbag
  ros-jade-roslaunch
  ros-jade-rosmsg
  ros-jade-rosparam
  ros-jade-ros
  ros-jade-rosgraph
  ros-jade-topic-tools
  ros-jade-rosconsole)
depends=(${ros_depends[@]})

# roslisp cannot be installed on ARM
if test "$CARCH" == x86_64 || test "$CARCH" == i686 ; then
  ros_depends+=('ros-jade-roslisp')
fi

# Git version (e.g. for debugging)
# _tag=release/jade/ros_comm/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ros_comm-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ros_comm-release-release-jade-ros_comm-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/ros_comm-release/archive/release/jade/ros_comm/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('12ccc22f919ca190cf9fc96be6e2eba42d6912287f2f221ec566d1dcce92ed9d')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/jade/setup.bash ] && source /opt/ros/jade/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/jade \
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
