pkgdesc="ROS - ROS message definitions for Velodyne 3D LIDARs."
url="https://github.com/ros-drivers/velodyne"

pkgname="ros-noetic-velodyne-msgs"
pkgver="1.7.0"
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
    ros-noetic-message-generation
    ros-noetic-std-msgs
    ros-noetic-message-runtime
)

depends=(
    ${ros_depends[@]}
)

_dir="velodyne-${pkgver}/velodyne_msgs"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ros-drivers/velodyne/archive/${pkgver}.tar.gz")
sha256sums=('49e813a75d1e5e653ed7f409b6e84b61af8296e1d7c98d8c20fee47771a2658a')

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
