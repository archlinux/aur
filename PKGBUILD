# Maintainer: DanielNak <daniel@tee.cat>

pkgname=ros-noetic-costmap-converter
pkgver=0.0.13
_pkgver_patch=0
pkgdesc="ROS : converts costmaps"
url='http://wiki.ros.org/costmap_converter'
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-noetic-catkin)

makedepends=(
  'cmake'
  'ros-build-tools'
  'pkg-config'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-noetic-roscpp 
  ros-noetic-costmap-2d
  ros-noetic-cv-bridge 
  ros-noetic-dynamic-reconfigure
  ros-noetic-pluginlib 
  ros-noetic-geometry-msgs 
  ros-noetic-nav-msgs
  ros-noetic-message-generation
  ros-noetic-message-runtime
  ros-noetic-roscpp
  ros-noetic-std-msgs
)

depends=(
  ${ros_depends[@]}
  python-rospkg
)

_dir="costmap_converter-${pkgver}/"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/rst-tu-dortmund/costmap_converter/archive/${pkgver}.tar.gz")
sha256sums=('f9d55eb31852533bc75a07bc11502b9923e2b6ce2949768a91197b1d4fba7a76')

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
