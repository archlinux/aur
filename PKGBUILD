# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgdesc="The odometry_saver package"
url='https://github.com/koide3/odometry_saver'

pkgname='ros-noetic-odometry-saver-git'
pkgver=r2.87197ad
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-noetic-catkin)
makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-roscpp
    ros-noetic-pcl-ros
    ros-noetic-pcl-conversions
    ros-noetic-nav-msgs
    ros-noetic-sensor-msgs
    ros-noetic-ndt-omp-git
)
depends=(
    ${ros_depends[@]}
)

source=(
    $pkgname::git://github.com/koide3/odometry_saver.git
)
sha256sums=(
    'SKIP'
)

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
    cd "$pkgname"
    sed -i '21d' src/odometry_saver.cpp
}

build() {
    # Use ROS environment variables
    [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

    # Build project
    cmake -Wno-dev -B build -S ${pkgname} \
            -DCMAKE_BUILD_TYPE=Release \
            -DCATKIN_ENABLE_TESTING=0 \
            -DCATKIN_BUILD_BINARY_PACKAGE=ON \
            -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
            -DPYTHON_EXECUTABLE=/usr/bin/python3 \
            -DSETUPTOOLS_DEB_LAYOUT=OFF \
            -DCMAKE_CXX_STANDARD=17
    make -sC build
}

package() {
    cd build
    make DESTDIR="${pkgdir}/" install
}
