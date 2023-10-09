pkgdesc="ROS - a package that provides several RQT widgets to view the status of Microstrain devices."
url="https://github.com/LORD-MicroStrain/microstrain_inertial"

pkgname="ros-noetic-microstrain-inertial-rqt"
pkgver="3.1.0"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=("MIT")

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
    ros-noetic-tf
    ros-noetic-rqt-gui
    ros-noetic-rqt-gui-py
    ros-noetic-std-msgs
    ros-noetic-nav-msgs
    ros-noetic-geometry-msgs
    ros-noetic-microstrain-inertial-msgs
)

depends=(
    ${ros_depends[@]}
)

_dir="microstrain_inertial-${pkgver}/microstrain_inertial_rqt"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/LORD-MicroStrain/microstrain_inertial/archive/${pkgver}.tar.gz"
    "microstrain_inertial_rqt_common.tar.gz::https://github.com/LORD-MicroStrain/microstrain_inertial_rqt_common/archive/dab05df89c4f4c5076e660c8a4ec97a1a4b757ab.tar.gz"
)
sha256sums=(
    '939b19ad132e627ed72b410d7898154452fcea181c12533355a879d38c8bdeee'
    'b74938c4bc9ee0a4ffa660da2e268cfb5e2455701f6ff1eff6050aaea11c2328')

prepare() {
    if [ -d ${_dir}/microstrain_inertial_rqt_common ]; then
        rm -rf ${_dir}/microstrain_inertial_rqt_common
    fi
    ln -s ${srcdir}/microstrain_inertial_rqt_common-dab05df89c4f4c5076e660c8a4ec97a1a4b757ab ${_dir}/microstrain_inertial_rqt_common
}

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
