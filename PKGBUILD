# Maintainer: michaelchou <michaeljchou at the hotmail domain which is .com>
# Contributor: michaelchou <michaeljchou at the hotmail domain which is .com>

pkgname=ros-melodic-socketcan-interface
pkgdesc='Generic CAN interface description with helpers for filtering and driver implementation. Further a socketcan implementation based on boost1.69::asio is included.'
url="http://wiki.ros.org/socketcan_interface?distro=melodic"

pkgver='0.8.5'
pkgrel=2
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
license=('LGPL3')

ros_makedepends=( ros-melodic-catkin
)
makedepends=(cmake ros-build-tools ${ros_makedepends[@]})

ros_depends=(
  ros-melodic-class-loader
)
depends=(boost1.69 linux-headers ${ros_depends[@]})

_dir="ros_canopen-${pkgver}/socketcan_interface"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-industrial/ros_canopen/archive/${pkgver}.tar.gz")
sha256sums=('3ef1aefdaadfc3548a9b3ea419709f858c1bb9bfdf85cf76ccd8bbcde5c34d9f')

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
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCATKIN_ENABLE_TESTING=0 \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
		 -DBOOST_ROOT=/opt/boost1.69
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}/" install
}
