pkgdesc="ROS - A set of packages that include controller interfaces, controller
managers, transmissions and hardware_interfaces."
url='http://wiki.ros.org/ros_control'

pkgname='ros-noetic-ros-control'
pkgver='0.19.1'
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
    ros-noetic-combined-robot-hw
    ros-noetic-controller-interface
    ros-noetic-controller-manager
    ros-noetic-controller-manager-msgs
    ros-noetic-hardware-interface
    ros-noetic-joint-limits-interface
    ros-noetic-realtime-tools
    ros-noetic-transmission-interface
)

depends=(
    ${ros_depends[@]}
)

_dir="ros_control-${pkgver}/ros_control"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-controls/ros_control/archive/${pkgver}.tar.gz")
sha256sums=('9b39e47e78c43f36c378c0557a68b4ba35f1f723314cbd541a460e6a340bc4ae')

build() {
    # Use ROS environment variables
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

    # Create the build directory
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    # Build the project
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
