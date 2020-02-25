pkgdesc="ROS - Contains a set of tools that can be used from a hard realtime
thread, without breaking the realtime behavior."
url='https://wiki.ros.org/realtime_tools'

pkgname='ros-melodic-realtime-tools'
pkgver='1.15.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-roscpp
  ros-melodic-catkin
  ros-melodic-rospy)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-roscpp
  ros-melodic-rospy)
depends=(${ros_depends[@]})

_dir="${srcdir}/realtime_tools-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-controls/realtime_tools/archive/${pkgver}.tar.gz")
sha256sums=('3356e9df104c177bd588db133eba65a351af62e35e64c87f2a5fc72c3fd2cd5a')

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
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
