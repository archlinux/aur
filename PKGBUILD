pkgdesc="ROS - rqt_multiplot provides a GUI plugin for visualizing numeric values in multiple 2D plots using the Qwt plotting backend."
url="https://wiki.ros.org/rqt_multiplot"

pkgname=ros-noetic-rqt-multiplot
pkgver='0.0.11'
pkgrel=1
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
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
    ros-noetic-rosbag
    ros-noetic-roscpp
    ros-noetic-rqt-gui
    ros-noetic-rqt-gui-cpp
    ros-noetic-variant-topic-tools
)

depends=(
    ${ros_depends[@]}
    qwt
    qt5-base
)

_dir="rqt_multiplot_plugin-${pkgver}"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/ANYbotics/rqt_multiplot_plugin/archive/${pkgver}.tar.gz"
    "FindQwt.cmake"
    "0.0.11.patch"
)
sha256sums=('79f0abc3fc26b31dd9d5e6eb01f6cfb5058b425e774c6455513ffe3f76de74b4' 'SKIP' 'SKIP')

prepare() {
    [ -d ${srcdir}/${_dir}/cmake ] || mkdir ${srcdir}/${_dir}/cmake
    cp ${srcdir}/FindQwt.cmake ${srcdir}/${_dir}/cmake/
    cd ${srcdir}/${_dir}
    patch -Np1 -i ${srcdir}/0.0.11.patch
}

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
