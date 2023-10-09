pkgdesc="ROS - a driver for the LORD/Microstrain inertial products."
url="https://github.com/LORD-MicroStrain/microstrain_inertial"

pkgname="ros-noetic-microstrain-inertial-driver"
pkgver="3.1.0"
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

_dir="microstrain_inertial-${pkgver}/microstrain_inertial_driver"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LORD-MicroStrain/microstrain_inertial/archive/${pkgver}.tar.gz")
sha256sums=('939b19ad132e627ed72b410d7898154452fcea181c12533355a879d38c8bdeee')

prepare() {
    cd ${_dir}
    sed -i 's/add_definitions(-std=c++11)/add_definitions(-std=c++14)/g' CMakeLists.txt
    if [ -d microstrain_inertial_driver_common ]; then
        rm -rf microstrain_inertial_driver_common
    fi
    git clone --recursive https://github.com/LORD-MicroStrain/microstrain_inertial_driver_common
    cd microstrain_inertial_driver_common
    git checkout 3d3d678c0e2562151464d741094c75fd37705bf0
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
