pkgdesc="ROS - Point Grey camera driver"
url='https://github.com/ros-drivers/pointgrey_camera_driver/tree/noetic-devel/pointgrey_camera_driver'

pkgname='ros-noetic-pointgrey-camera-driver'
pkgver='0.15.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=("BSD")

ros_makedepends=(
    ros-noetic-catkin
)

makedepends=(
    cmake
    ros-build-tools
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
    libusb
    libraw1394
    ros-noetic-image-proc
    ros-noetic-stereo-image-proc
    ros-noetic-roslaunch
    ros-noetic-roslint
)

depends=(
    ${ros_depends[@]}
)

_dir="pointgrey_camera_driver-${pkgver}/pointgrey_camera_driver"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ros-drivers/pointgrey_camera_driver/archive/${pkgver}.tar.gz")
sha256sums=('f81a2ad2260a686bdd961d129d8f980b68454e70eb257fe3fdc39d4f5fcf53ad')

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
