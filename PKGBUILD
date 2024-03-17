pkgdesc="ROS - Scripts for installing Jackal's robot software."
url="https://github.com/jackal/jackal_robot"

pkgname="ros-noetic-jackal-bringup"
pkgver="0.7.10"
arch=('x86_64')
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
    ros-noetic-jackal-base
    ros-noetic-lms1xx
    ros-noetic-urg-node
    ros-noetic-velodyne-pointcloud
    ros-noetic-pointgrey-camera-driver
    ros-noetic-microstrain-inertial-driver
    ros-noetic-nmea-comms
    ros-noetic-nmea-navsat-driver
    ros-noetic-robot-upstart
    ros-noetic-sick-tim
    ros-noetic-spinnaker-camera-driver
)

depends=(
    ${ros_depends[@]}
    python-scipy
)

_dir="jackal_robot-${pkgver}/jackal_bringup"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jackal/jackal_robot/archive/${pkgver}.tar.gz")
sha256sums=('ea7047d8bb868cbbf3f3a59c86477b6e3a740dcb19e3f21dbdd8f27ad8ec03b2')

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
