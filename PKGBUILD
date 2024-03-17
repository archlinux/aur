pkgdesc="ROS - A package that contains ROS message corresponding to microstrain message types."
url="https://github.com/LORD-MicroStrain/microstrain_inertial"

pkgname="ros-noetic-microstrain-inertial-msgs"
pkgver="4.0.1"
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

_commit="6a2f27040934d862963999afbb2456f7cb2fa02b"
_msgs_common_commit="c5c41e685cd166dfdef6e70886cd3f68d08bdc72"
_dir="microstrain_inertial-${_commit}/microstrain_inertial_msgs"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/LORD-MicroStrain/microstrain_inertial/archive/${_commit}.tar.gz"
    "microstrain_inertial_msgs_common.tar.gz::https://github.com/LORD-MicroStrain/microstrain_inertial_msgs_common/archive/${_msgs_common_commit}.tar.gz"
)
sha256sums=(
    '8b9ebb1073dee8cc3d1062390aa3809ca9138b0d014b83bc3ec3feb7de392929'
    '4c5a4451fe0d9d49c809b0713dc069245dbdeca714f307e38059546dbb20b738')

prepare() {
    if [ -d ${_dir}/microstrain_inertial_msgs_common ]; then
        rm -rf ${_dir}/microstrain_inertial_msgs_common
    fi
    ln -s ${srcdir}/microstrain_inertial_msgs_common-${_msgs_common_commit} ${_dir}/microstrain_inertial_msgs_common
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
