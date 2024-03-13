pkgdesc="ROS - Spinnaker camera driver based on Spinnaker"
url='https://github.com/ros-drivers/flir_camera_driver/tree/noetic-devel'

pkgname='ros-noetic-spinnaker-camera-driver'
pkgver='0.2.5'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=("BSD")

ros_makedepends=(
    ros-noetic-catkin
)

makedepends=(
    cmake
    ros-build-tools
    curl
    dpkg
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-roscpp
    ros-noetic-nodelet
    ros-noetic-sensor-msgs
    ros-noetic-wfov-camera-msgs
    ros-noetic-image-exposure-msgs
    ros-noetic-camera-info-manager
    ros-noetic-image-transport
    ros-noetic-dynamic-reconfigure
    ros-noetic-diagnostic-updater
    ros-noetic-image-proc
    ros-noetic-roslaunch
    ros-noetic-roslint
    libusb
    libspinnaker-dev
)

depends=(
    ${ros_depends[@]}
)

_dir="flir_camera_driver-${pkgver}/spinnaker_camera_driver"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ros-drivers/flir_camera_driver/archive/${pkgver}.tar.gz")
sha256sums=('0ba5d2ac9564565fe27a15566c638654be2ab9e91cb8251853fa6c248b9ba380')

prepare() {
    sed -i "s/gcc540/gcc11/g" "${srcdir}/${_dir}/cmake/install_files"
    sed -i "s/libSpinnaker.so.1.13.0.31/libSpinnaker.so.3.1.0.79/g" "${srcdir}/${_dir}/cmake/install_files"
    sed -i "s/libSpinnaker.so.1/libSpinnaker.so.3/g" "${srcdir}/${_dir}/cmake/install_files"
    sed -i -E "s/SFNC_GenTL.*xml;//g" "${srcdir}/${_dir}/cmake/install_files"
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
