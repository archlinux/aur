# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - experimental packages for moveit"
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit-experimental'
pkgver='1.0.3'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
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
makedepends=('eigen' 'cmake' 'boost1.69' 'assimp' 'urdfdom' 'urdfdom-headers'
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
depends=('eigen' 'cmake' 'boost1.69' 'assimp' 'urdfdom' 'urdfdom-headers'
  ${ros_makedepends[@]})

# Tarball version (faster download)
_dir="moveit-${pkgver}/moveit_experimental"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz")
sha256sums=('b0ac91cd4c4dc29d9bd5e3885a1a457252495b3f2bedb46ddfe04154f5ac2358')

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
		 -DBOOST_ROOT=/opt/boost1.69
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
