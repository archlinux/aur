pkgdesc="ROS - Topic tools for treating messages as variant types."
url="https://github.com/ANYbotics/variant"

pkgname=ros-noetic-variant-topic-tools
pkgver='0.1.22'
pkgrel=1
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
license=('LGPL')

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
    ros-noetic-roslib
    ros-noetic-variant-msgs
    ros-noetic-geometry-msgs
    ros-noetic-std-msgs
)

depends=(
    ${ros_depends[@]}
    gtest
)

_commit="83ef3d9e2b2a94d5ca29c226fc030795b70c289b"
_dir="variant-${_commit}/variant_topic_tools"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ANYbotics/variant/archive/${_commit}.tar.gz")
sha256sums=('4d85ec2a9e88bfd31fa78f42fbfdef147a3a2d40b1943f03004bae83e015b2f5')

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
