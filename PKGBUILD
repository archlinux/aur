# Maintainer: michaelchou <michaeljchou at the hotmail domain which is .com>
# Contributor: michaelchou <michaeljchou at the hotmail domain which is .com>

pkgname=ros-melodic-socketcan-interface
_pkgname=socketcan_interface
pkgdesc='Generic CAN interface description with helpers for filtering and driver implementation. Further a socketcan implementation based on boost::asio is included.'
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
  ros-melodic-class-loader
)
depends=(boost linux-headers ${ros_depends[@]})

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir}/${_pkgname} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
        -DPYTHON_BASENAME=.cpython-37m \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}/" install
}
