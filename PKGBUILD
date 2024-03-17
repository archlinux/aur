pkgdesc="ROS - Metapackage of software to install on Jackal."
url="https://github.com/jackal/jackal_robot"

pkgname="ros-noetic-jackal-robot"
pkgver="0.7.10"
arch=('x86_64')
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
    ros-noetic-jackal-bringup
    # ros-noetic-jackal-firmware
    # ros-noetic-jackal-tests
)

depends=(
    ${ros_depends[@]}
)

_dir="jackal_robot-${pkgver}/jackal_robot"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jackal/jackal_robot/archive/${pkgver}.tar.gz")
sha256sums=('ea7047d8bb868cbbf3f3a59c86477b6e3a740dcb19e3f21dbdd8f27ad8ec03b2')

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
