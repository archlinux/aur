pkgdesc="Helper functions for displaying and debugging MoveIt data in Rviz via published markers."
url='https://wiki.ros.org/moveit_visual_tools'

pkgname='ros-noetic-moveit-visual-tools'
pkgver='3.6.0'
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
)

ros_depends=(
    ros-noetic-cmake-modules
    ros-noetic-geometry-msgs
    ros-noetic-graph-msgs
    ros-noetic-moveit-core
    ros-noetic-moveit-ros-planning
    ros-noetic-roscpp
    ros-noetic-roslint
    ros-noetic-rviz-visual-tools
    ros-noetic-std-msgs
    ros-noetic-tf2-eigen
    ros-noetic-tf2-ros
    ros-noetic-trajectory-msgs
    ros-noetic-visualization-msgs
)

depends=(
    ${ros_depends[@]}
)

_dir="moveit_visual_tools-${pkgver}"

source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/moveit_visual_tools/archive/${pkgver}.tar.gz")
sha256sums=('747956d416529483247dc3e2baad4a6046e1d9eef87592ef3396302ffea6acc3')

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

