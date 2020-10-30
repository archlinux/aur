pkgdesc="ROS - ROS interface to the 3Dconnexion SpaceNavigator 6DOF joystick."
url='https://wiki.ros.org/spacenav_node'

pkgname='ros-noetic-spacenav-node'
pkgver='1.15.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-catkin
    ros-noetic-roscpp
    ros-noetic-geometry-msgs
    ros-noetic-sensor-msgs
)
makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
    libspnav
    libx11
)

ros_depends=(
    ros-noetic-roscpp
    ros-noetic-geometry-msgs
    ros-noetic-sensor-msgs
)
depends=(
    ${ros_depends[@]}
    spacenavd
    libspnav
    libx11
)

_dir="joystick_drivers-${pkgver}/spacenav_node"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-drivers/joystick_drivers/archive/${pkgver}.tar.gz")
sha256sums=('37e82742674a5fd4cf9959051aeae3bb961da74f254f891909d10589266166ad')

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
