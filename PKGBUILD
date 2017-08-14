# Maintainer: Firas Zaidan <firas@zaidan.de>
pkgdesc="ROS - This metapackage depends on the SMACH visualization tools."
url='http://ros.org/wiki/smach'

pkgname='ros-kinetic-executive-smach-visualization-smach-viewer'
pkgver='2.0.1'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-kinetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-smach
  ros-kinetic-smach-msgs
  ros-kinetic-smach-ros
  ros-kinetic-xdot
  ros-kinetic-executive-smach-visualization-rqt-smach)
depends=(${ros_depends[@]}
  xdot)

_dir="executive_smach_visualization/smach_viewer"
source=("git+https://github.com/mcgill-robotics/executive_smach_visualization.git#branch=kinetic-devel")
sha256sums=('SKIP')

# _dir="executive_smach_visualization-${pkgver}"
# source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/executive_smach_visualization/archive/${pkgver}.tar.gz")
# sha256sums=('8a60f2b0a74fe34483be162a8760e34c58f54986c9caf5d117e6a3ac1be58b80')

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
