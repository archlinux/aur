pkgdesc="Generalized ROS interface to NMEA-speaking devices."
url='https://wiki.ros.org/nmea_comms'

pkgname='ros-noetic-nmea-comms'
pkgver='1.2.0'
arch=('x86_64')
pkgrel=1
license=('BSD')

ros_makedepends=(
  ros-noetic-catkin
  ros-noetic-roscpp
  ros-noetic-roslint
  ros-noetic-nmea-msgs
  ros-noetic-roslaunch
  ros-noetic-rostest)

makedepends=(
  'cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(
  ros-noetic-roscpp
  ros-noetic-nmea-msgs)
depends=(${ros_depends[@]})

_dir=nmea_comms-$pkgver
source=("https://github.com/ros-drivers/nmea_comms/archive/refs/tags/$pkgver.tar.gz")
md5sums=('SKIP')

build() {
    # Use ROS environment variables
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

    # Build project
    cmake -B build -S ${_dir}\
            -DCMAKE_BUILD_TYPE=Release \
            -DCATKIN_ENABLE_TESTING=0 \
            -DCATKIN_BUILD_BINARY_PACKAGE=ON \
            -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
            -DPYTHON_EXECUTABLE=/usr/bin/python3 \
            -DPYTHON_INCLUDE_DIR=/usr/include/python3.9 \
            -DPYTHON_LIBRARY=/usr/lib/libpython3.9.so \
            -DPYTHON_BASENAME=-python3.9 \
            -DSETUPTOOLS_DEB_LAYOUT=OFF
    make -C build
}

package() {
    cd build
    make DESTDIR="${pkgdir}/" install
}
