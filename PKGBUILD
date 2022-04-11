pkgdesc="ROS - Core libraries used by MoveIt!."
url='https://moveit.ros.org'

pkgname='ros-noetic-moveit-core'
pkgver='1.1.8'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(
    ros-noetic-catkin
)

makedepends=(
    cmake
    pkg-config
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-eigen-stl-containers
    ros-noetic-geometric-shapes
    ros-noetic-geometry-msgs
    ros-noetic-kdl-parser
    ros-noetic-urdf
    ros-noetic-moveit-msgs
    ros-noetic-octomap
    ros-noetic-octomap-msgs
    ros-noetic-pybind11-catkin
    ros-noetic-random-numbers
    ros-noetic-roslib
    ros-noetic-rostime
    ros-noetic-rosconsole
    ros-noetic-sensor-msgs
    ros-noetic-shape-msgs
    ros-noetic-srdfdom
    ros-noetic-std-msgs
    ros-noetic-tf2-eigen
    ros-noetic-tf2-geometry-msgs
    ros-noetic-trajectory-msgs
    ros-noetic-visualization-msgs
    ros-noetic-xmlrpcpp
    ros-noetic-pluginlib
    ros-noetic-tf2-kdl
    ros-noetic-angles
)

depends=(
    assimp
    boost
    eigen
    bullet
    python
    fcl
    console-bridge
    urdfdom
    urdfdom-headers
    ${ros_depends[@]}
)

_dir="moveit-${pkgver}/moveit_core"
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
