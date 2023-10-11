pkgdesc="ROS - rqt_multiplot provides a GUI plugin for visualizing numeric values in multiple 2D plots using the Qwt plotting backend."
url="https://wiki.ros.org/rqt_multiplot"

pkgname=ros-noetic-rqt-multiplot
pkgver='0.0.12'
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

_commit="dbdc6965843a79415e5310372deb37bc93e0c2a1"
_dir="rqt_multiplot_plugin-${_commit}"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/ANYbotics/rqt_multiplot_plugin/archive/${_commit}.tar.gz"
    "FindQwt.cmake"
    "0.0.12.patch"
)
sha256sums=(
    '40d1f1f35e265ff4f24b0d7b8ac21bea5d88c96ab1a59977c87d941abfb02c74'
    '62fc7abb314220cf9d9ed3cd947c08469c518b76c119007058cd9bf45d555fed'
    '3b904970c78fd73e48eb613710754a68f409e0fedf44b472b8acc6893abbb3e3'
)

prepare() {
    [ -d ${srcdir}/${_dir}/cmake ] || mkdir ${srcdir}/${_dir}/cmake
    cp ${srcdir}/FindQwt.cmake ${srcdir}/${_dir}/cmake/
    cd ${srcdir}/${_dir}
    patch -Np1 -i ${srcdir}/0.0.12.patch
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
