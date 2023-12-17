pkgdesc="ROS - Library of ros controllers."
url='http://ros.org/wiki/ros_controllers'

pkgname='ros-noetic-ros-controllers'
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
    ros-noetic-ackermann-steering-controller
    ros-noetic-diff-drive-controller
    ros-noetic-forward-command-controller
    ros-noetic-imu-sensor-controller
    ros-noetic-position-controllers
    ros-noetic-force-torque-sensor-controller
    ros-noetic-gripper-action-controller
    ros-noetic-joint-state-controller
    ros-noetic-joint-trajectory-controller
    ros-noetic-effort-controllers
    ros-noetic-velocity-controllers
)

depends=(
    ${ros_depends[@]}
)

_dir="ros_controllers-${pkgver}/ros_controllers"
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

