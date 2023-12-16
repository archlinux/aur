pkgdesc="ROS - Controller to publish state of force-torque sensors."
url='http://wiki.ros.org/force_torque_sensor_controller'

pkgname='ros-noetic-force-torque-sensor-controller'
pkgver='0.21.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-catkin
)

makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-controller-interface
    ros-noetic-geometry-msgs
    ros-noetic-hardware-interface
    ros-noetic-pluginlib
    ros-noetic-realtime-tools
    ros-noetic-roscpp
)

depends=(
    ${ros_depends[@]}
)

_dir="ros_controllers-${pkgver}/force_torque_sensor_controller"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-controls/ros_controllers/archive/${pkgver}.tar.gz")
sha256sums=('19e710b944e972ffb7fadb2d149f97bcdc1c2c0cf38a20405c09afced1543ba4')

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
