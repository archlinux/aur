pkgdesc="ROS - Planning components of MoveIt that use ROS."
url='https://moveit.ros.org'

pkgname='ros-noetic-moveit-ros-planning'
pkgver='1.1.8'
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
    ros-noetic-moveit-ros-occupancy-map-monitor
    ros-noetic-moveit-msgs
    ros-noetic-message-filters
    ros-noetic-pluginlib
    ros-noetic-actionlib
    ros-noetic-dynamic-reconfigure
    ros-noetic-rosconsole
    ros-noetic-roscpp
    ros-noetic-srdfdom
    ros-noetic-urdf
    ros-noetic-tf2
    ros-noetic-tf2-eigen
    ros-noetic-tf2-geometry-msgs
    ros-noetic-tf2-msgs
    ros-noetic-tf2-ros
    ros-noetic-moveit-resources-panda-moveit-config
)
depends=(
    ${ros_depends[@]}
)

_dir="moveit-${pkgver}/moveit_ros/planning"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz")
sha256sums=('2a88440169593037c4adbf14896c30def63f8b3af85f1239e8ef94ee62b0b969')

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
