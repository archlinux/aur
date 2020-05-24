# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - experimental packages for moveit"
url='https://moveit.ros.org'

pkgname='ros-noetic-moveit-experimental'
pkgver='1.0.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(console-bridge
  'ros-noetic-pluginlib>=1.11.2'
  ros-noetic-octomap-msgs
  ros-noetic-moveit-msgs
  ros-noetic-actionlib-msgs
  ros-noetic-geometry-msgs
  ros-noetic-sensor-msgs
  ros-noetic-shape-msgs
  ros-noetic-std-msgs
  ros-noetic-trajectory-msgs
  ros-noetic-visualization-msgs
  ros-noetic-octomap
  ros-noetic-kdl-parser
  ros-noetic-eigen-stl-containers
  ros-noetic-tf2-eigen
  'ros-noetic-geometric-shapes>=0.3.4'
  ros-noetic-roslib
  ros-noetic-rostime
  ros-noetic-rosconsole
  ros-noetic-moveit-core)
makedepends=('eigen' 'cmake' 'boost' 'assimp' 'urdfdom' 'urdfdom-headers'
  ${ros_makedepends[@]})

ros_depends=(console-bridge
  'ros-noetic-pluginlib>=1.11.2'
  ros-noetic-octomap-msgs
  ros-noetic-moveit-msgs
  ros-noetic-actionlib-msgs
  ros-noetic-geometry-msgs
  ros-noetic-sensor-msgs
  ros-noetic-shape-msgs
  ros-noetic-std-msgs
  ros-noetic-trajectory-msgs
  ros-noetic-visualization-msgs
  ros-noetic-octomap
  ros-noetic-kdl-parser
  ros-noetic-eigen-stl-containers
  ros-noetic-tf2-eigen
  'ros-noetic-geometric-shapes>=0.3.4'
  ros-noetic-roslib
  ros-noetic-rostime
  ros-noetic-rosconsole
  ros-noetic-moveit-core)
depends=('eigen' 'cmake' 'boost' 'assimp' 'urdfdom' 'urdfdom-headers'
  ${ros_makedepends[@]})

# Tarball version (faster download)
_dir="moveit-${pkgver}/moveit_experimental"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz")
sha256sums=('b8194308c57dbe34bbb729cfccb30d1113af3a54a90a2cfb49482142d1044ea4')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/ros/noetic/lib64/pkgconfig

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
