pkgdesc="ROS - octovis is visualization tool for the OctoMap library based on Qt and libQGLViewer."
url='https://octomap.github.io'

pkgname='ros-noetic-octovis'
pkgver='1.9.7'
arch=('any')
pkgrel=1
license=('GPLv2')

ros_makedepends=(
)
makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
)
depends=(
    ${ros_depends[@]}
    octomap
    libqglviewer
    qt5-base
)

_dir="octomap-${pkgver}/octovis"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/OctoMap/octomap/archive/v${pkgver}.tar.gz")
sha256sums=('3e9ac020686ceb4e17e161bffc5a0dafd9cccab33adeb9adee59a61c418ea1c1')

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
