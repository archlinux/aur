pkgdesc="ROS - This metapackage depends on packages for interfacing common joysticks and human input devices with ROS."
url='https://wiki.ros.org/joystick_drivers'

pkgname='ros-noetic-joystick-drivers'
pkgver='1.15.0'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-catkin
)
makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-wiimote
    ros-noetic-joy
    ros-noetic-ps3joy
    ros-noetic-spacenav-node
)
depends=(
    ${ros_depends[@]}
)

_dir="joystick_drivers-${pkgver}/joystick_drivers"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/joystick_drivers/archive/${pkgver}.tar.gz")
sha256sums=('37e82742674a5fd4cf9959051aeae3bb961da74f254f891909d10589266166ad')

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
