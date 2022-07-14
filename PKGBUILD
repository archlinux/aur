pkgdesc="ROS - franka_description contains URDF files and meshes of Franka Emika robots"
url='https://wiki.ros.org/franka_description'

pkgname='ros-noetic-franka-description'
pkgver="0.9.0"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('Apache 2.0')

ros_makedepends=(
    ros-noetic-catkin
)
makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)
ros_depends=(
    ros-noetic-xacro
)
depends=(
    ${ros_depends[@]}
)

_dir="franka_ros-${pkgver}/franka_description"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/frankaemika/franka_ros/archive/${pkgver}.tar.gz")
sha256sums=("e1858ed46bcc56bb336fd0e1bd1f9de6870a4313d130430bbefdef3ab4d0c991")

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
