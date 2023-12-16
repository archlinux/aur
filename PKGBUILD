pkgdesc="ROS - Parser for Semantic Robot Description Format (SRDF)."
url='https://wiki.ros.org/srdfdom'

pkgname='ros-noetic-srdfdom'
pkgver='0.6.4'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-noetic-urdfdom-py
  ros-noetic-urdf
  ros-noetic-catkin
  ros-noetic-cmake-modules
  ros-noetic-rostest)
makedepends=(cmake ros-build-tools
  ${ros_makedepends[@]}
  boost
  console-bridge
  tinyxml
  urdfdom-headers)

ros_depends=(ros-noetic-urdfdom-py)
depends=(${ros_depends[@]}
  boost
  console-bridge
  tinyxml
  urdfdom-headers)

_dir="srdfdom-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/srdfdom/archive/${pkgver}.tar.gz")
sha256sums=('2a57b2a4c8f3c45f7fbfd57419be3833d7f1e6e9fd75c444ef62916cc7b9930b')

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
