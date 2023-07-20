pkgdesc="ROS - Library of twist multiplexer"
url='http://wiki.ros.org/twist_mux'

pkgname='ros-noetic-twist-mux'
pkgver='3.1.3'
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
    ros-noetic-std-msgs
    ros-noetic-geometry-msgs
    ros-noetic-visualization-msgs
    ros-noetic-diagnostic-updater
    ros-noetic-rostest
)

depends=(
    ${ros_depends[@]}
)

_dir="twist_mux-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ros-teleop/twist_mux/archive/${pkgver}.tar.gz")
sha256sums=('36890d97cd76038c84ab93b1c326140f2b9a073c2fd0bea7f86c5d8324f9bab1')

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
