pkgdesc="ROS - Components of MoveIt that offer simpler interfaces to planning and execution."
url='https://wiki.ros.org/moveit_ros_planning_interface'

pkgname='ros-noetic-moveit-ros-planning-interface'
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
    python-catkin-pkg
    eigen
)

ros_depends=(
    ros-noetic-moveit-ros-planning
    ros-noetic-moveit-ros-warehouse
    ros-noetic-moveit-ros-move-group
    ros-noetic-moveit-ros-manipulation
    ros-noetic-roscpp
    ros-noetic-rospy
    ros-noetic-rosconsole
    ros-noetic-actionlib
    ros-noetic-geometry-msgs
    ros-noetic-moveit-msgs
    ros-noetic-tf2
    ros-noetic-tf2-eigen
    ros-noetic-tf2-geometry-msgs
    ros-noetic-tf2-ros
)

depends=(
    ${ros_depends[@]}
    python
    eigenpy
)

_dir="moveit-${pkgver}/moveit_ros/planning_interface"
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
