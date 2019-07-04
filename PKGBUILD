# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - experimental packages for moveit"
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit-experimental'
pkgver='0.10.5'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(console-bridge
  'ros-melodic-pluginlib>=1.11.2'
  ros-melodic-octomap-msgs
  ros-melodic-moveit-msgs
  ros-melodic-actionlib-msgs
  ros-melodic-geometry-msgs
  ros-melodic-sensor-msgs
  ros-melodic-shape-msgs
  ros-melodic-std-msgs
  ros-melodic-trajectory-msgs
  ros-melodic-visualization-msgs
  ros-melodic-octomap
  ros-melodic-kdl-parser
  ros-melodic-eigen-stl-containers
  ros-melodic-tf2-eigen
  'ros-melodic-geometric-shapes>=0.3.4'
  ros-melodic-roslib
  ros-melodic-rostime
  ros-melodic-rosconsole
  ros-melodic-moveit-core)
makedepends=('eigen' 'cmake' 'boost' 'assimp' 'urdfdom' 'urdfdom-headers'
  ${ros_makedepends[@]})

ros_depends=(console-bridge
  'ros-melodic-pluginlib>=1.11.2'
  ros-melodic-octomap-msgs
  ros-melodic-moveit-msgs
  ros-melodic-actionlib-msgs
  ros-melodic-geometry-msgs
  ros-melodic-sensor-msgs
  ros-melodic-shape-msgs
  ros-melodic-std-msgs
  ros-melodic-trajectory-msgs
  ros-melodic-visualization-msgs
  ros-melodic-octomap
  ros-melodic-kdl-parser
  ros-melodic-eigen-stl-containers
  ros-melodic-tf2-eigen
  'ros-melodic-geometric-shapes>=0.3.4'
  ros-melodic-roslib
  ros-melodic-rostime
  ros-melodic-rosconsole
  ros-melodic-moveit-core)
depends=('eigen' 'cmake' 'boost' 'assimp' 'urdfdom' 'urdfdom-headers'
  ${ros_makedepends[@]})

# Tarball version (faster download)
_dir="moveit-release-release-melodic-moveit_experimental-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/moveit-release/archive/release/melodic/moveit_experimental/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('1a5c675fee0f1ee3b36ead7c63454687eab1c86e75c674465522df5bb83b1814')

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
