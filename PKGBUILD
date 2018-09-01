# Maintainer: michaelchou <michaeljchou at the hotmail domain which is .com>
# Contributor: michaelchou <michaeljchou at the hotmail domain which is .com>

pkgname=ros-melodic-socketcan-bridge
_pkgname=socketcan_bridge
pkgdesc='Conversion nodes for messages from SocketCAN to a ROS Topic and vice versa.'
url="http://wiki.ros.org/${_pkgname}?distro=melodic"

pkgver=0.8.0
pkgrel=2
arch=('any')
license=('LGPL3')

_parent_pkgname="ros_canopen"
_dir="ros_canopen-${pkgver}"
source=("${_parent_pkgname}-${pkgver}.tar.gz::https://github.com/ros-industrial/ros_canopen/archive/${pkgver}.tar.gz")
sha256sums=('b822d2a70eb273076d7dfde847bd52593d6577503207beb98a43b96855f64250')

ros_makedepends=(
)
makedepends=(cmake ros-build-tools ${ros_makedepends[@]})

ros_depends=(
  ros-melodic-can-msgs
  ros-melodic-roscpp
  ros-melodic-socketcan-interface
)
depends=(${ros_depends[@]})

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

#   # Fix Python2/Python3 conflicts
#   /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir -p ${srcdir}/build
  cd ${srcdir}/build

  # Build project
  cmake ${srcdir}/${_dir}/${_pkgname} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DCATKIN_ENABLE_TESTING=OFF \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
#         -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
#         -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
#         -DPYTHON_BASENAME=-python2.7 \
#         -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}/" install
}
