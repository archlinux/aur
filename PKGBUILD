pkgdesc="ROS - libfranka is a C++ library for Franka Emika research robots "
url="http://wiki.ros.org/libfranka"

pkgname='ros-noetic-libfranka'
pkgver='0.9.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('Apache 2.0')

ros_makedepends=(
)
makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
    poco
)

ros_depends=(
    ros-noetic-catkin
)
depends=(
    ${ros_depends[@]}
    poco
    eigen
)

_dir="libfranka-release-upstream-$pkgver"
source=("$pkgname-$pkgver.tar.gz::https://github.com/frankaemika/libfranka-release/archive/upstream/$pkgver.tar.gz")
sha256sums=('afb776817e19283e68b2936224f611eba49dd7bc308dfeb567c49fa44ccdb6d1')

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
