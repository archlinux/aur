# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgdesc="ROS - ROS messages for the cartographer_ros package."
url='https://github.com/googlecartographer/cartographer_ros'

pkgname='ros-noetic-cartographer-ros-msgs-git'
pkgver=r584.151c563
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('Apache 2.0')
provides=(${pkgname::-4})

ros_makedepends=(
  ros-noetic-std-msgs
  ros-noetic-catkin
  ros-noetic-geometry-msgs
  ros-noetic-message-generation
)

makedepends=(
  cmake
  ros-build-tools
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-noetic-message-runtime
  ros-noetic-geometry-msgs
  ros-noetic-std-msgs
)
depends=(${ros_depends[@]})

source=($pkgname::git://github.com/cartographer-project/cartographer_ros.git)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
    # Use ROS environment variables
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

    # Create build directory
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    # Build project
    cmake ${srcdir}/${pkgname}/cartographer_ros_msgs \
            -DCMAKE_BUILD_TYPE=Release \
            -DCATKIN_ENABLE_TESTING=0 \
            -DCATKIN_BUILD_BINARY_PACKAGE=ON \
            -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
            -DPYTHON_EXECUTABLE=/usr/bin/python3 \
            -DPYTHON_INCLUDE_DIR=/usr/include/python3.9 \
            -DPYTHON_LIBRARY=/usr/lib/libpython3.9.so \
            -DPYTHON_BASENAME=-python3.9 \
            -DSETUPTOOLS_DEB_LAYOUT=OFF
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}
