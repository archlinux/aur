pkgdesc="ROS - Package to parse NMEA strings and publish a very simple GPS message. Does not require or use the GPSD deamon."
url="https://github.com/ros-drivers/nmea_navsat_driver"

pkgname="ros-noetic-nmea-navsat-driver"
pkgver="0.6.1"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=("BSD")

ros_makedepends=(
    ros-noetic-catkin
)

makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-rospy
    ros-noetic-geometry-msgs
    ros-noetic-nmea-msgs
    ros-noetic-sensor-msgs
    ros-noetic-tf
    ros-noetic-roslint
    ros-noetic-rostest
)

depends=(
    ${ros_depends[@]}
    python-catkin_pkg
    python-pyserial
    python-rospkg
    python-yaml
)

_dir="nmea_navsat_driver-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ros-drivers/nmea_navsat_driver/archive/${pkgver}.tar.gz")
sha256sums=('8ea788e3474a47f54895c259072c961d6070aafb8f9635c7a70c6aee06dd6db3')

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
