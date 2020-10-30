pkgdesc="ROS - Library for visual odometry"
url='https://wiki.ros.org/libviso2'

pkgname='ros-noetic-libviso2'
pkgver='0.0.1'
arch=('any')
pkgrel=3
license=('GPL')

makedepends=(
    cmake
    gcc-libs
)
depends=(
    gcc-libs
)

_dir="viso2/libviso2"
source=("viso2"::"git+https://github.com/srv/viso2.git")
sha256sums=('SKIP')

prepare() {
    sed -i -e "/install(DIRECTORY/s/$/\//" -e "/PATTERN/s/.cpp/*.cpp/" ${srcdir}/${_dir}/CMakeLists.txt
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
