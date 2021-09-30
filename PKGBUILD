# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgdesc="ROS package for real-time 6DOF SLAM using a 3D LIDAR"
url='https://github.com/koide3/hdl_graph_slam'

pkgname='ros-noetic-hdl-graph-slam-git'
pkgver=r168.d93a8be
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=5
license=('BSD 2-Clause License')

ros_makedepends=(ros-noetic-catkin)
makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)


ros_depends=(
    ros-noetic-ndt-omp
    ros-noetic-fast-gicp
    ros-noetic-pcl-ros    
    ros-noetic-cpp-common
    ros-noetic-rospy
    ros-noetic-geodesy
    ros-noetic-nodelet
    ros-noetic-nmea-msgs
    ros-noetic-sensor-msgs
    ros-noetic-message-generation
)
depends=(
    ${ros_depends[@]}
    g2o
    openmp
)

source=(
    $pkgname::git://github.com/koide3/hdl_graph_slam.git
    patch.patch
)
sha256sums=(
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
    cd "$pkgname"
    sed -i '5i#include <boost/optional.hpp>' apps/floor_detection_nodelet.cpp
    patch --forward --strip=1 --input="${srcdir}/patch.patch"
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
