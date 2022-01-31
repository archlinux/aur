pkgdesc="ROS - Components of MoveIt that offer visualization."
url='https://wiki.ros.org/moveit_ros_visualization'

pkgname='ros-noetic-moveit-ros-visualization'
pkgver='1.1.8'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-catkin
    ros-noetic-class-loader
)
makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
    pkg-config
    eigen
    ogre
    qt5-base
)

ros_depends=(
    ros-noetic-geometric-shapes
    ros-noetic-interactive-markers
    ros-noetic-moveit-ros-robot-interaction
    ros-noetic-moveit-ros-perception
    ros-noetic-moveit-ros-planning-interface
    ros-noetic-moveit-ros-warehouse
    ros-noetic-object-recognition-msgs
    ros-noetic-pluginlib
    ros-noetic-rosconsole
    ros-noetic-roscpp
    ros-noetic-rospy
    ros-noetic-rviz
    ros-noetic-tf2-eigen
)
depends=(
    ${ros_depends[@]}
)

_dir="moveit-${pkgver}/moveit_ros/visualization"
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
