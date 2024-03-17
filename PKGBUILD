pkgdesc="ROS - a driver for the LORD/Microstrain inertial products."
url="https://github.com/LORD-MicroStrain/microstrain_inertial"

pkgname="ros-noetic-microstrain-inertial-driver"
pkgver="4.0.1"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=("MIT")

ros_makedepends=(
    ros-noetic-catkin
)

makedepends=(
    git
    curl
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-roscpp
    ros-noetic-cmake-modules
    ros-noetic-diagnostic-updater
    ros-noetic-tf2
    ros-noetic-tf2-ros
    ros-noetic-std-msgs
    ros-noetic-std-srvs
    ros-noetic-geometry-msgs
    ros-noetic-sensor-msgs
    ros-noetic-nav-msgs
    ros-noetic-nmea-msgs
    ros-noetic-mavros-msgs
    ros-noetic-tf2-geometry-msgs
    ros-noetic-microstrain-inertial-msgs
    ros-noetic-message-generation
    ros-noetic-roslint
    ros-noetic-message-runtime
    ros-noetic-diagnostic-aggregator
)

depends=(
    ${ros_depends[@]}
)

_commit="6a2f27040934d862963999afbb2456f7cb2fa02b"
_driver_common_commit="3c7cc7ebf5fdd3db411a439de9c569cae15f214e"
_dir="microstrain_inertial-${_commit}/microstrain_inertial_driver"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LORD-MicroStrain/microstrain_inertial/archive/${_commit}.tar.gz")
sha256sums=('8b9ebb1073dee8cc3d1062390aa3809ca9138b0d014b83bc3ec3feb7de392929')

prepare() {
    cd ${_dir}
    sed -i 's/add_definitions(-std=c++11)/add_definitions(-std=c++14)/g' CMakeLists.txt
    sed -i 's/${COMMON_INC_DIR}\/utils\/clock_bias_monitor.h//g' CMakeLists.txt
    if [ -d microstrain_inertial_driver_common ]; then
        rm -rf microstrain_inertial_driver_common
    fi
    git clone --recursive https://github.com/LORD-MicroStrain/microstrain_inertial_driver_common
    cd microstrain_inertial_driver_common
    git checkout ${_driver_common_commit}
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
