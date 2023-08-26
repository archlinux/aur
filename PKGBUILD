_pkgname=octomap_server
pkgname=ros2-humble-octomap-server
pkgver=2.0.0
path="octomap_mapping-$pkgver/$_pkgname"
pkgrel=1
pkgdesc="Loads a 3D map (as Octree-based OctoMap) and distributes it to other nodes."
url="https://index.ros.org/p/$_pkgname/"
arch=('any')
depends=('ros2-humble' 'ros2-humble-octomap-ros')
source=("https://github.com/OctoMap/octomap_mapping/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('da4e946a0a7f448d548ab4026f48f1f3bb49d5db90e7420d0b1b2faf6244a50a')

prepare() {
    #https://github.com/OctoMap/octomap_mapping/pull/118 
    sed -i "1113s/FilterLimits//" $srcdir/$path/src/octomap_server.cpp
}

build() {
    source /opt/ros/humble/setup.bash

    cmake -B build -S "$path" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/opt/ros/humble' \
        -Wno-dev
    
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
