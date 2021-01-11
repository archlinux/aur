pkgdesc="ROS - Utility functions for displaying and debugging data in Rviz via published markers."
url='https://wiki.ros.org/rviz_visual_tools'

pkgname='ros-noetic-rviz-visual-tools'
pkgver='3.9.1'
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
    ros-noetic-rviz
    ros-noetic-sensor-msgs
    ros-noetic-tf2-eigen
    ros-noetic-tf2-ros
    ros-noetic-tf2-geometry-msgs
    ros-noetic-geometry-msgs
    ros-noetic-shape-msgs
    ros-noetic-roscpp
    ros-noetic-visualization-msgs
    ros-noetic-graph-msgs
    ros-noetic-std-msgs
    ros-noetic-trajectory-msgs
    ros-noetic-roslint
    ros-noetic-eigen-stl-containers
    ros-noetic-interactive-markers
)

depends=(
    ${ros_depends[@]}
    ogre
    qt5-x11extras
)

_dir="rviz_visual_tools-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/PickNikRobotics/rviz_visual_tools/archive/${pkgver}.tar.gz")
sha256sums=('cabd0c665a464e5e0027cbdece555d933a1f6f963fbc5b088f0c1b39fe817486')

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
