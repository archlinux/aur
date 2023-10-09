pkgdesc="ROS - A package that contains ROS message corresponding to microstrain message types."
url="https://github.com/LORD-MicroStrain/microstrain_inertial"

pkgname="ros-noetic-microstrain-inertial-msgs"
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
    ros-noetic-message-generation
    ros-noetic-std-msgs
    ros-noetic-geometry-msgs
    ros-noetic-message-runtime
)

depends=(
    ${ros_depends[@]}
)

_dir="microstrain_inertial-${pkgver}/microstrain_inertial_msgs"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/LORD-MicroStrain/microstrain_inertial/archive/${pkgver}.tar.gz"
    "microstrain_inertial_msgs_common.tar.gz::https://github.com/LORD-MicroStrain/microstrain_inertial_msgs_common/archive/488b325b69e9d1286ce3003953dde940da2e198f.tar.gz"
)
sha256sums=(
    '939b19ad132e627ed72b410d7898154452fcea181c12533355a879d38c8bdeee'
    '954624245a32fe1a036bf27a3c4ab850532ec56a39f0fbfa7234573e8d4c2255')

prepare() {
    if [ -d ${_dir}/microstrain_inertial_msgs_common ]; then
        rm -rf ${_dir}/microstrain_inertial_msgs_common
    fi
    ln -s ${srcdir}/microstrain_inertial_msgs_common-488b325b69e9d1286ce3003953dde940da2e198f ${_dir}/microstrain_inertial_msgs_common
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
