# Maintainer: michaelchou <michaeljchou at the hotmail domain which is .com>
# Contributor: michaelchou <michaeljchou at the hotmail domain which is .com>

pkgname=ros-melodic-can-msgs
pkgdesc='CAN related message types.'
url="http://wiki.ros.org/can_msgs?distro=melodic"

pkgver='0.8.3'
pkgrel=1
arch=('any')
license=('LGPL3')

_dir="ros_canopen-${pkgver}/can_msgs"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-industrial/ros_canopen/archive/${pkgver}.tar.gz")
sha256sums=('2ca77051aae92d9ebf10fda9f2f561d66111a685dda5e148cc0790a93c463c22')

ros_makedepends=(
  ros-melodic-message-generation
)
makedepends=(cmake ros-build-tools ${ros_makedepends[@]})

ros_depends=(
  ros-melodic-message-runtime
  ros-melodic-std-msgs
)
depends=(${ros_depends[@]})

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
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR="${pkgdir}/" install
}
