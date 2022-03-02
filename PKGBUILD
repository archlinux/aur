# Maintainer: DanielNak <daniel@tee.cat>

pkgname=ros-noetic-ddynamic-reconfigure
pkgver=0.4.1
pkgdesc="ROS - The ddynamic_reconfigure package."
url='https://github.com/pal-robotics/ddynamic_reconfigure'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
  ros-noetic-dynamic-reconfigure
  ros-noetic-catkin
  ros-noetic-roscpp
)

makedepends=(
  'cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-noetic-dynamic-reconfigure
  ros-noetic-roscpp
)

depends=(
  ${ros_depends[@]}
)

_dir="ddynamic_reconfigure-${pkgver}/"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/pal-robotics/ddynamic_reconfigure/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('dd832cbadd4e45454aa3589daab2d2673b64ea376dcaeba9fe6eb4d5f6683317')

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
