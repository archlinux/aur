pkgdesc="ROS - ROS messages for publishing graphs of different data types."
url='https://wiki.ros.org/graph_msgs'

pkgname='ros-noetic-graph-msgs'
pkgver='0.1.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-catkin
    ros-noetic-message-generation
    ros-noetic-std-msgs
    ros-noetic-geometry-msgs
)

makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-std-msgs
    ros-noetic-geometry-msgs
    ros-noetic-message-runtime
)

depends=(
    ${ros_depends[@]}
)

_dir="graph_msgs-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/PickNikRobotics/graph_msgs/archive/${pkgver}.tar.gz")
sha256sums=('41fb66143d8c5f2929b8d13cad786fc890e7b6e16b97ac21acbe102212fd4eee')

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

