pkgdesc="ROS - PlotJuggler: juggle with data"
url='https://www.plotjuggler.io'

pkgname='ros-noetic-plotjuggler'
pkgver='3.7.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('LGPLv3')

ros_makedepends=(
    ros-noetic-catkin
    ros-noetic-roscpp
)

makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-roslib
)

depends=(
    ${ros_depends[@]}
    qt5-base
    qt5-svg
    qt5-websockets
    qt5-x11extras
    binutils
    boost
    zeromq
)

_dir="PlotJuggler-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/facontidavide/PlotJuggler/archive/${pkgver}.tar.gz"
        "cstdint.patch"::"https://github.com/facontidavide/PlotJuggler/pull/830.patch")
sha256sums=('3260f4c3cc5c562e99bc65920f9e4fc072ad2621a02e0a9cfe74b1706b7d767b'
            'SKIP')

prepare() {
    cd "${srcdir}/PlotJuggler-${pkgver}"
    patch -Np1 -i "${srcdir}/cstdint.patch"
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
