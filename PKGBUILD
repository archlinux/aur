pkgdesc="ROS - Launch files and code for autonomous navigation of the Jackal"
url='https://github.com/jackal/jackal'

pkgname='ros-noetic-jackal-navigation'
pkgver='0.8.9'
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
    ros-noetic-roslaunch
    ros-noetic-amcl
    ros-noetic-gmapping
    ros-noetic-map-server
    ros-noetic-move-base
    ros-noetic-urdf
    ros-noetic-xacro
)

depends=(
    ${ros_depends[@]}
)

_dir="jackal-${pkgver}/jackal_navigation"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jackal/jackal/archive/${pkgver}.tar.gz")
sha256sums=('90c29c3be73a0960ec6b210c069e35b79e676f71efc61e44124e65031bb1db33')

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
