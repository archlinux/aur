pkgdesc="RealSense Camera package allowing access to Intel T265 Tracking module and SR300 and D400 3D cameras"
url='http://www.ros.org/wiki/RealSense'

pkgname='ros-noetic-realsense2-camera'
pkgver='2.3.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=("Apache-2.0")

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
    ros-noetic-image-transport
    ros-noetic-cv-bridge
    ros-noetic-nav-msgs
    ros-noetic-nodelet
    ros-noetic-genmsg
    ros-noetic-roscpp
    ros-noetic-sensor-msgs
    ros-noetic-std-msgs
    ros-noetic-std-srvs
    ros-noetic-message-runtime
    ros-noetic-tf
    ros-noetic-dynamic-reconfigure
    ros-noetic-diagnostic-updater
    librealsense2
    eigen
)

depends=(
    ${ros_depends[@]}
)

_dir="realsense-ros-31d7c2b328b1b4d72a9e24d946341705b7b8907c/realsense2_camera"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/IntelRealSense/realsense-ros/archive/31d7c2b328b1b4d72a9e24d946341705b7b8907c.tar.gz")
sha256sums=('3cc1bb0ba1c4499142486a682583ae0d049b6b8e22295f07a62754f3e6ce7068')

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
