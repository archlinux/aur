pkgdesc="ROS - PlotJuggler plugin for ROS"
url='https://www.plotjuggler.io'

pkgname='ros-noetic-plotjuggler-ros'
pkgver='1.7.3'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('LGPLv3')

ros_makedepends=(
    ros-noetic-catkin
)

makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-rosbag-storage
    ros-noetic-roscpp
    ros-noetic-roscpp-serialization
    ros-noetic-tf
    ros-noetic-diagnostic-msgs
    ros-noetic-sensor-msgs
    ros-noetic-geometry-msgs
    ros-noetic-nav-msgs
    ros-noetic-tf2-ros
    ros-noetic-tf2-msgs
    ros-noetic-plotjuggler-msgs
    ros-noetic-plotjuggler
)

depends=(
    ${ros_depends[@]}
    qt5-base
    binutils
    qt5-svg
    qt5-websockets
    boost
)

_dir="plotjuggler-ros-plugins-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/PlotJuggler/plotjuggler-ros-plugins/archive/${pkgver}.tar.gz")
sha256sums=('2b61bd1409e586a819f7c7a6c720395d9b9bdda650351afe16a1cdd57fde0f82')

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
