pkgdesc="ROS - A ROS driver for the SICK TiM and the SICK MRS 1000 laser scanners"
url='https://wiki.ros.org/sick_tim'

pkgname='ros-noetic-sick-tim'
pkgver='0.0.17'
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
    libusb
    ros-noetic-roscpp
    ros-noetic-sensor-msgs
    ros-noetic-roslaunch
    ros-noetic-diagnostic-updater
    ros-noetic-dynamic-reconfigure
    ros-noetic-robot-state-publisher
    ros-noetic-xacro
)

depends=(
    ${ros_depends[@]}
)

_dir="sick_tim-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/uos/sick_tim/archive/${pkgver}.tar.gz")
sha256sums=('fd9ebe745b9361938936766ef0eddbce1e68dc902a8d76eb2e25069c15ac4f2e')

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
