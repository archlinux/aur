pkgdesc="ROS - rosparam wrapper with improved error checking."
url='https://github.com/PickNikRobotics/rosparam_shortcuts'

pkgname='ros-noetic-rosparam-shortcuts'
pkgver='0.3.3'
arch=('x86_64')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-catkin
    ros-noetic-eigen-conversions
    ros-noetic-roslint
)

makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-rosparam
    ros-noetic-rosout
)

depends=(
    ${ros_depends[@]}
)

_dir="rosparam_shortcuts-${pkgver}/"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/PickNikRobotics/rosparam_shortcuts/archive/${pkgver}.tar.gz")
sha256sums=('3022ea05b63f57209ceb0fb0df21c7c8747d8af9825949a65e94d9cb7a2ef8cc')

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
