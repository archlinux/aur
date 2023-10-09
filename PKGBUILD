pkgdesc="ROS - Library of messages exclusive to Jackal, especially for representing low-level motor commands and sensors"
url='https://github.com/jackal/jackal'

pkgname='ros-noetic-jackal-msgs'
pkgver='0.8.8'
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
    ros-noetic-message-generation
    ros-noetic-std-msgs
    ros-noetic-message-runtime
)

depends=(
    ${ros_depends[@]}
)

_dir="jackal-${pkgver}/jackal_msgs"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jackal/jackal/archive/${pkgver}.tar.gz")
sha256sums=('ef3f56b7cb56b3230ea755a797e7e59f41ed51143d7fab25a5579c4e5ea890eb')

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
