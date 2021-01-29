pkgdesc="ROS - This package provides an implementation of the Dynamic Window
Approach to local robot navigation on a plane."
url='https://wiki.ros.org/dwa_local_planner'

pkgname='ros-noetic-dwa-local-planner'
pkgver='1.17.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-catkin
    ros-noetic-angles
    ros-noetic-cmake-modules
)

makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-base-local-planner
    ros-noetic-costmap-2d
    ros-noetic-dynamic-reconfigure
    ros-noetic-nav-core
    ros-noetic-nav-msgs
    ros-noetic-pluginlib
    ros-noetic-sensor-msgs
    ros-noetic-roscpp
    ros-noetic-tf2
    ros-noetic-tf2-geometry-msgs
    ros-noetic-tf2-ros
)

depends=(
    eigen
    ${ros_depends[@]}
)

_dir="navigation-${pkgver}/dwa_local_planner"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/navigation/archive/${pkgver}.tar.gz")
sha256sums=('50e1fb4a0beb190202e9730180464b76b3a481cae2665e0f1944eb908929148e')

build() {
    # Use ROS environment variables.
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

    # Create the build directory.
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    # Build the project.
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
