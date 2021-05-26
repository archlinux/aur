# Maintainer: Oskar Roesler <oskar@oskar-roesler.de>
pkgdesc="ROS - Core libraries used by MoveIt!."
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit-core'
pkgver='1.0.8'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(
  ros-melodic-moveit-resources
  ros-melodic-angles
)

makedepends=(
  'cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  pkg-config
)

ros_depends=(
  ros-melodic-eigen-stl-containers
  ros-melodic-geometric-shapes
  ros-melodic-geometry-msgs
  ros-melodic-kdl-parser
  ros-melodic-moveit-msgs
  ros-melodic-octomap
  ros-melodic-octomap-msgs
  ros-melodic-pybind11-catkin
  ros-melodic-random-numbers
  ros-melodic-rosconsole
  ros-melodic-roslib
  ros-melodic-rostime
  ros-melodic-sensor-msgs
  ros-melodic-shape-msgs
  ros-melodic-srdfdom
  ros-melodic-std-msgs
  ros-melodic-tf2-eigen
  ros-melodic-tf2-geometry-msgs
  ros-melodic-trajectory-msgs
  ros-melodic-urdf
  ros-melodic-visualization-msgs
  ros-melodic-xmlrpcpp
)

depends=(
  ${ros_depends[@]}
  eigen
  urdfdom-headers
  assimp
  console-bridge
  boost1.69
  urdfdom
  fcl
)

_dir="moveit-${pkgver}/moveit_core"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz")
sha256sums=('9f94cac094e0cd73caf2fb75ff85870045239806852aa00f6122f4785da23c14')

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

  export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/ros/melodic/lib64/pkgconfig

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
		 -DBOOST_ROOT=/opt/boost1.69 \
		 -DBoost_NO_SYSTEM_PATHS=TRUE
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
