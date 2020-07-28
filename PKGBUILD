pkgdesc="ROS - Components of MoveIt! connecting to occupancy map"
url='https://wiki.ros.org/moveit_ros'

pkgname='ros-noetic-moveit-ros-occupancy-map-monitor'
pkgver='1.0.5'
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
    eigen
)

ros_depends=(
    ros-noetic-moveit-core
    ros-noetic-moveit-msgs
    ros-noetic-pluginlib
    ros-noetic-tf2-ros
    ros-noetic-geometric-shapes
)
depends=(
    ${ros_depends[@]}
    octomap
)

_dir="moveit-${pkgver}/moveit_ros/occupancy_map_monitor"
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
