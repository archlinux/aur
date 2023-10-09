pkgdesc="ROS - robot_upstart package provides scripts which may be used to install and uninstall Ubuntu Linux upstart jobs which launch groups of roslaunch files."
url="https://github.com/jackal/jackal_robot"

pkgname="ros-noetic-robot-upstart"
pkgver="0.4.2"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=("BSD")

ros_makedepends=(
    ros-noetic-catkin
)

makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-roslaunch
    ros-noetic-xacro
    ros-noetic-roslint
    ros-noetic-rosunit
)

depends=(
    ${ros_depends[@]}
    daemontools-encore
    net-tools
    util-linux
)

_dir="robot_upstart-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/clearpathrobotics/robot_upstart/archive/${pkgver}.tar.gz")
sha256sums=('a44f17af0c428837316c7f4d9fc393e74cd6f6c9286e1915f84d57348e418d06')

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
