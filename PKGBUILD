pkgdesc="ROS - Packages for working with Jackal from a ROS desktop."
url="https://github.com/jackal/jackal_desktop"

pkgname="ros-noetic-jackal-desktop"
pkgver="0.4.1"
arch=('x86_64')
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
    ros-noetic-jackal-msgs
    ros-noetic-jackal-viz
)

depends=(
    ${ros_depends[@]}
)

_dir="jackal_desktop-${pkgver}/jackal_desktop"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jackal/jackal_desktop/archive/${pkgver}.tar.gz")
sha256sums=('17637450e38712cc8d773c60e1527780b2aa33b2522b4342241163eb72f2e618')

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
