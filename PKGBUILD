# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Core libraries used by MoveIt!."
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit-core'
pkgver='0.10.8'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-eigen-stl-containers
  ros-melodic-octomap-msgs
  ros-melodic-trajectory-msgs
  ros-melodic-moveit-msgs
  ros-melodic-roslib
  ros-melodic-kdl-parser
  ros-melodic-geometry-msgs
  ros-melodic-urdf
  ros-melodic-random-numbers
  ros-melodic-rostime
  ros-melodic-srdfdom
  ros-melodic-octomap
  ros-melodic-visualization-msgs
  ros-melodic-sensor-msgs
  ros-melodic-geometric-shapes
  ros-melodic-catkin
  ros-melodic-eigen-conversions
  ros-melodic-std-msgs
  ros-melodic-shape-msgs
  ros-melodic-tf2-eigen
  ros-melodic-fcl
  ros-melodic-moveit-resources)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  eigen
  urdfdom-headers
  assimp
  console-bridge
  boost
  urdfdom
  pkg-config)

ros_depends=(ros-melodic-eigen-stl-containers
  ros-melodic-octomap-msgs
  ros-melodic-trajectory-msgs
  ros-melodic-moveit-msgs
  ros-melodic-std-msgs
  ros-melodic-kdl-parser
  ros-melodic-geometry-msgs
  ros-melodic-urdf
  ros-melodic-random-numbers
  ros-melodic-rostime
  ros-melodic-srdfdom
  ros-melodic-octomap
  ros-melodic-visualization-msgs
  ros-melodic-sensor-msgs
  ros-melodic-geometric-shapes
  ros-melodic-eigen-conversions
  ros-melodic-fcl
  ros-melodic-tf2-eigen
  ros-melodic-moveit-resources)
depends=(${ros_depends[@]}
  eigen
  urdfdom-headers
  assimp
  console-bridge
  boost
  urdfdom)

# Git version (e.g. for debugging)
# _tag=release/melodic/moveit_core/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/moveit-release.git"#tag=${_tag})
# sha256sums=('6178568b18b13a3570a8ae85c404227e1e3fbd57250b23d7d705795c2463be57')

# Tarball version (faster download)
_dir="moveit-release-release-melodic-moveit_core-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/moveit-release/archive/release/melodic/moveit_core/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('fddfeda19b8bf9f745e839e1b1576fa010c1959f21e9aba65a447d097b32e812')

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
