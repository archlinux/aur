pkgdesc="ROS - PlotJuggler: juggle with data"
url='https://www.plotjuggler.io'

pkgname='ros-noetic-plotjuggler'
pkgver='2.8.3'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
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
    ros-noetic-diagnostic-msgs
    ros-noetic-tf
    ros-noetic-sensor-msgs
    ros-noetic-geometry-msgs
    ros-noetic-nav-msgs
    ros-noetic-tf2-ros
    ros-noetic-tf2-msgs
    ros-noetic-plotjuggler-msgs
)

depends=(
    ${ros_depends[@]}
    qt5-base
    qt5-declarative
    qt5-multimedia
    binutils
    qt5-svg
    boost
)

_dir="PlotJuggler-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/facontidavide/PlotJuggler/archive/${pkgver}.tar.gz"
        "qpainterpath.patch"::"https://patch-diff.githubusercontent.com/raw/facontidavide/PlotJuggler/pull/313.patch")
sha256sums=('2b8eb6b8fc8d1e259d2cf907eb0dc495cf1e3117f7683f4f5179beae76be628b'
            'SKIP')

prepare() {
    cd "$srcdir/$_dir"
    patch --forward --strip=1 --input="${srcdir}/qpainterpath.patch"
}

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
