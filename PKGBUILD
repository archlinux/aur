pkgdesc="ROS - Drivers for the Microsoft Kinect, Asus Xtion, and Primesense Devices."
url='https://wiki.ros.org/openni_camera'

pkgname='ros-noetic-openni-camera'
pkgver='1.11.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(
    ros-noetic-nodelet
    ros-noetic-roscpp
    ros-noetic-camera-info-manager
    ros-noetic-dynamic-reconfigure
    ros-noetic-sensor-msgs
    ros-noetic-image-transport
    ros-noetic-catkin
)
makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
    openni
)

ros_depends=(
    ros-noetic-nodelet
    ros-noetic-roscpp
    ros-noetic-message-runtime
    ros-noetic-camera-info-manager
    ros-noetic-dynamic-reconfigure
    ros-noetic-sensor-msgs
    ros-noetic-image-transport
)
depends=(
    ${ros_depends[@]}
    openni
)

_dir="openni_camera-${pkgver}/openni_camera"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/openni_camera/archive/${pkgver}.tar.gz")
sha256sums=('4dd0109628b5f8ed497ed11b35023ac82a9ecd3658469dc35b1a04f52ba14daf')

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
