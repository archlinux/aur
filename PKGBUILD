# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - experimental packages for moveit"
url='https://moveit.ros.org'

pkgname='ros-melodic-moveit-experimental'
pkgver='1.0.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
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
_dir="moveit-${pkgver}/moveit_experimental"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz")
sha256sums=('b8194308c57dbe34bbb729cfccb30d1113af3a54a90a2cfb49482142d1044ea4')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
