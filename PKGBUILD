# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>

pkgdesc="open source 3D LIDAR-based mapping framework"
url='https://github.com/SMRT-AIST/interactive_slam'

pkgname='ros-noetic-interactive-slam-git'
pkgver=r80.b39352f
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('GPLv3')

ros_makedepends=(ros-noetic-catkin)
makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
    g2o
    openmp
    pcl
    glfw-x11
    glm
)

ros_depends=(
    ros-noetic-geodesy
    ros-noetic-pcl-ros
    ros-noetic-nmea-msgs
    ros-noetic-hdl-graph-slam-git
    ros-noetic-odometry-saver-git
)
depends=(
    ${ros_depends[@]}
)

imgui_hash=c077dd4872f435dd959feb024e5a9adb2c7df20c
portable_hash=ece1202552b887bb2dc72d0364f5b2069639e53c
source=(
    $pkgname::git://github.com/koide3/interactive_slam.git
    imgui::https://github.com/ocornut/imgui/archive/$imgui_hash.tar.gz
    portable-file-dialogs::https://github.com/samhocevar/portable-file-dialogs/archive/$portable_hsh.tar.gz
    https://github.com/SMRT-AIST/interactive_slam/pull/50.patch
    https://github.com/SMRT-AIST/interactive_slam/pull/51.patch
    https://github.com/SMRT-AIST/interactive_slam/pull/52.patch
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
    mv -n imgui-$imgui_hash/* "$pkgname/thirdparty/imgui"
    mv -n portable-file-dialogs-$portable_hash/* "$pkgname/thirdparty/portable-file-dialogs"
    cd $pkgname
    patch --forward --strip=1 --input="${srcdir}/50.patch"
    patch --forward --strip=1 --input="${srcdir}/51.patch"
    patch --forward --strip=1 --input="${srcdir}/52.patch"
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
