pkgdesc="ROS - Converts representations of sensor_msgs/LaserScan and sensor_msgs/MultiEchoLaserScan"
url="https://github.com/ros-perception/laser_proc"

pkgname="ros-noetic-laser-proc"
pkgver="0.1.6"
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
    ros-noetic-roscpp
    ros-noetic-rosconsole
    ros-noetic-sensor-msgs
    ros-noetic-pluginlib
    ros-noetic-nodelet
)

depends=(
    ${ros_depends[@]}
)

_dir="laser_proc-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ros-perception/laser_proc/archive/${pkgver}.tar.gz")
sha256sums=('ce421a0cd53d0bed992b28c4baeab17f398caddd3d953c82d46982cfe0c08fd4')


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
