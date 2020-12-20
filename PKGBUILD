pkgdesc="ROS - Contains a set of tools that can be used from a hard realtime
thread, without breaking the realtime behavior."
url='https://wiki.ros.org/realtime_tools'

pkgname='ros-noetic-realtime-tools'
pkgver='1.16.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=6
license=('BSD')

ros_makedepends=(
    ros-noetic-catkin
    ros-noetic-actionlib
)
makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-roscpp
    ros-noetic-rosunit
    ros-noetic-rostest
    ros-noetic-actionlib
)
depends=(
    ${ros_depends[@]}
)

_dir="${srcdir}/realtime_tools-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-controls/realtime_tools/archive/${pkgver}.tar.gz"
        "atomic.patch"::"https://github.com/ros-controls/realtime_tools/commit/f3d6ff3c30285d5d78953b5d9bf1f93f756beedc.patch")
sha256sums=('690222fd2908cec0412d20f6e8b5d8a17132d959edb719e01695e89f7c4d8111'
            'c2c2fc92f87f734bd0a5f70758f96f724036870c98bd8fd936729a9daaee66f4')

prepare() {
    cd "${srcdir}/${_dir}"
    patch -Np1 -i "${srcdir}"/atomic.patch
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
