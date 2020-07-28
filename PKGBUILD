pkgdesc="ROS - Components of MoveIt connecting to perception."
url='https://wiki.ros.org/moveit_ros_perception'

pkgname='ros-noetic-moveit-ros-perception'
pkgver='1.0.5'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-catkin
)
makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
    eigen
)

ros_depends=(
    ros-noetic-moveit-core
    ros-noetic-roscpp
    ros-noetic-rosconsole
    ros-noetic-urdf
    ros-noetic-message-filters
    ros-noetic-pluginlib
    ros-noetic-image-transport
    ros-noetic-cv-bridge
    ros-noetic-sensor-msgs
    ros-noetic-moveit-msgs
    ros-noetic-object-recognition-msgs
    ros-noetic-tf2
    ros-noetic-tf2-eigen
    ros-noetic-tf2-geometry-msgs
    ros-noetic-tf2-ros
    ros-noetic-moveit-ros-occupancy-map-monitor
)
depends=(
    ${ros_depends[@]}
    glut
    glew
    mesa-libgl
)

_dir="moveit-${pkgver}/moveit_ros/perception"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz")
sha256sums=('78f874c64156d761c77e0988ae1a4d9e492023b33664dcf1299ec6154f2bd45a')

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
