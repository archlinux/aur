pkgdesc="ROS - Core libraries used by MoveIt!."
url='https://moveit.ros.org'

pkgname='ros-noetic-moveit-core'
pkgver='1.0.5'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-moveit-resources
    ros-noetic-angles
)

makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
    pkg-config
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
)

depends=(
    ${ros_depends[@]}
    eigen
    urdfdom-headers
    assimp
    console-bridge
    boost
    urdfdom
    fcl
)

_dir="moveit-${pkgver}/moveit_core"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit/archive/${pkgver}.tar.gz")
sha256sums=('78f874c64156d761c77e0988ae1a4d9e492023b33664dcf1299ec6154f2bd45a')

#prepare() {
#  cd ${srcdir}
#  find . \( -iname *.cpp -o -iname *.h \) \
#      -exec sed -r -i "s/[^_]logError/CONSOLE_BRIDGE_logError/" {} \; \
#      -exec sed -r -i "s/[^_]logWarn/CONSOLE_BRIDGE_logWarn/" {} \; \
#      -exec sed -r -i "s/[^_]logDebug/CONSOLE_BRIDGE_logDebug/" {} \; \
#      -exec sed -r -i "s/[^_]logInform/CONSOLE_BRIDGE_logInform/" {} \;
#}

build() {
    # Use ROS environment variables
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

    # Create build directory
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    #export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/ros/noetic/lib64/pkgconfig

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
