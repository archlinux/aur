pkgdesc="ROS - A set of drivers for Flir cameras based on the Spinnaker SDK."
url='https://github.com/ros-drivers/flir_camera_driver'

pkgname='ros-noetic-flir-camera-driver'
pkgver='0.2.5'
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
    ros-noetic-spinnaker-camera-driver
    ros-noetic-flir-camera-description
)

depends=(
    ${ros_depends[@]}
)

_dir="flir_camera_driver-${pkgver}/flir_camera_driver"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ros-drivers/flir_camera_driver/archive/${pkgver}.tar.gz")
sha256sums=('0ba5d2ac9564565fe27a15566c638654be2ab9e91cb8251853fa6c248b9ba380')

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
