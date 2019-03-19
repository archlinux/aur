# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Core libraries used by MoveIt!."
url='http://moveit.ros.org'

pkgname='ros-kinetic-moveit-core'
pkgver='0.9.15'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-eigen-stl-containers
  ros-kinetic-octomap-msgs
  ros-kinetic-trajectory-msgs
  ros-kinetic-moveit-msgs
  ros-kinetic-roslib
  ros-kinetic-kdl-parser
  ros-kinetic-geometry-msgs
  ros-kinetic-urdf
  ros-kinetic-random-numbers
  ros-kinetic-rostime
  ros-kinetic-srdfdom
  ros-kinetic-octomap
  ros-kinetic-visualization-msgs
  ros-kinetic-sensor-msgs
  ros-kinetic-geometric-shapes
  ros-kinetic-catkin
  ros-kinetic-eigen-conversions
  ros-kinetic-std-msgs
  ros-kinetic-shape-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen
  urdfdom-headers
  fcl
  assimp
  console-bridge
  boost
  urdfdom
  pkg-config)

ros_depends=(ros-kinetic-eigen-stl-containers
  ros-kinetic-octomap-msgs
  ros-kinetic-trajectory-msgs
  ros-kinetic-moveit-msgs
  ros-kinetic-std-msgs
  ros-kinetic-kdl-parser
  ros-kinetic-geometry-msgs
  ros-kinetic-urdf
  ros-kinetic-random-numbers
  ros-kinetic-rostime
  ros-kinetic-srdfdom
  ros-kinetic-octomap
  ros-kinetic-visualization-msgs
  ros-kinetic-sensor-msgs
  ros-kinetic-geometric-shapes
  ros-kinetic-eigen-conversions)
depends=(${ros_depends[@]}
  eigen
  urdfdom-headers
  fcl
  assimp
  console-bridge
  boost
  urdfdom)

# Git version (e.g. for debugging)
# _tag=release/kinetic/moveit_core/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="moveit-release-release-kinetic-moveit_core-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/moveit-release/archive/release/kinetic/moveit_core/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('20ea70a20528c25d48d6ea0c58d6e23ea26b1d92efb231425e92deb15862d0bd')

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
