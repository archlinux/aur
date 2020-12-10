pkgdesc="ROS - A rosout GUI viewer developed at Southwest Research Insititute as an alternative to rqt_console."
url='http://ros.org/wiki/swri_console'

pkgname='ros-melodic-swri-console'
pkgver='1.1.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=5
license=('BSD')

ros_makedepends=(ros-melodic-rosgraph-msgs
  ros-melodic-roscpp
  ros-melodic-rosbag-storage
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  boost1.69
  qt5-base)

ros_depends=(ros-melodic-rosgraph-msgs
  ros-melodic-roscpp
  ros-melodic-rosbag-storage)
depends=(${ros_depends[@]}
  boost1.69
  qt5-base)

_dir="swri_console-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/swri-robotics/swri_console/archive/${pkgver}.tar.gz")
sha256sums=('da27e4f92247ce7016a4325ef7ffea0ed18fa6fe671ce0b7f17652778ce9481c')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
		 -DBOOST_ROOT=/opt/boost1.69
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
