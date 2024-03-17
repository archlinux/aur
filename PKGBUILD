pkgdesc="ROS - a package that provides several RQT widgets to view the status of Microstrain devices."
url="https://github.com/LORD-MicroStrain/microstrain_inertial"

pkgname="ros-noetic-microstrain-inertial-rqt"
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

_commit="6a2f27040934d862963999afbb2456f7cb2fa02b"
_rqt_common_commit="2d1affd5df90555b17e52c7b1622090f96141e4f"
_dir="microstrain_inertial-${_commit}/microstrain_inertial_rqt"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/LORD-MicroStrain/microstrain_inertial/archive/${_commit}.tar.gz"
)
sha256sums=('8b9ebb1073dee8cc3d1062390aa3809ca9138b0d014b83bc3ec3feb7de392929')

prepare() {
    cd ${_dir}
    if [ -d microstrain_inertial_rqt_common ]; then
        rm -rf microstrain_inertial_rqt_common
    fi
    git clone --recursive https://github.com/LORD-MicroStrain/microstrain_inertial_rqt_common
    cd microstrain_inertial_rqt_common
    git checkout ${_rqt_common_commit}
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
