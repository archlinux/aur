pkgdesc="ROS - MAVLink message marshaling library."
url='https://wiki.ros.org/mavlink'

pkgname='ros-noetic-mavlink'
pkgver='2021.11.11'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('LGPLv3')

ros_makedepends=()
makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
    python-lxml
    python-future
    python-distribute
    python
)

ros_depends=(
    ros-noetic-catkin
)
depends=(
    ${ros_depends[@]}
    python
)

_dir="mavlink-gbp-release-upstream-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/mavlink/mavlink-gbp-release/archive/upstream/${pkgver}.tar.gz")
sha256sums=('cf44620c81b65099b23b21527a3be6efe71ebfd4ba2fae590e45a0474c46c127')

build() {
    # Use ROS environment variables
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

    # Build project
    cmake -Wno-dev -B build -S ${_dir} \
          -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic
    make -sC build
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}
