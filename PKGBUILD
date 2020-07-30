pkgdesc="ROS - Simple simulation interface and template for setting up a
hardware interface for ros_control"
url='https://github.com/davetcoleman/ros_control_boilerplate'

pkgname='ros-noetic-ros-control-boilerplate'
pkgver='0.6.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-catkin
    ros-noetic-hardware-interface
    ros-noetic-controller-manager
    ros-noetic-roscpp
    ros-noetic-control-msgs
    ros-noetic-trajectory-msgs
    ros-noetic-actionlib
    ros-noetic-urdf
    ros-noetic-joint-limits-interface
    ros-noetic-transmission-interface
    ros-noetic-control-toolbox
    ros-noetic-std-msgs
    ros-noetic-cmake-modules
    ros-noetic-sensor-msgs
    ros-noetic-rosparam-shortcuts
)
makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
    gflags
)

ros_depends=(
    ros-noetic-hardware-interface
    ros-noetic-controller-manager
    ros-noetic-roscpp
    ros-noetic-control-msgs
    ros-noetic-trajectory-msgs
    ros-noetic-actionlib
    ros-noetic-urdf
    ros-noetic-joint-limits-interface
    ros-noetic-transmission-interface
    ros-noetic-control-toolbox
    ros-noetic-std-msgs
    ros-noetic-sensor-msgs
    ros-noetic-rosparam-shortcuts
)

depends=(
    ${ros_depends[@]}
)

_dir="ros_control_boilerplate-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/PickNikRobotics/ros_control_boilerplate/archive/${pkgver}.tar.gz")
sha256sums=('7307174e6016061c6c73e48edb1fa91685d8c8af68cb716acfa8afddd02602d7')

build() {
    # Use ROS environment variables
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

    # Create the build directory
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    # Build the project
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
