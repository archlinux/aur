pkgdesc="ROS - This package contains generic definitions of geometric shapes and bodies."
url='http://wiki.ros.org/geometric_shapes'

pkgname='ros-noetic-geometric-shapes'
pkgver='0.7.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-resource-retriever
    ros-noetic-eigen-stl-containers
    ros-noetic-catkin
    ros-noetic-octomap
    ros-noetic-shape-msgs
    ros-noetic-random-numbers
    ros-noetic-visualization-msgs
)
makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
    qhull
    assimp
    eigen
    boost
    console-bridge
    pkg-config
)

ros_depends=(
    ros-noetic-resource-retriever
    ros-noetic-eigen-stl-containers
    ros-noetic-octomap
    ros-noetic-shape-msgs
    ros-noetic-random-numbers
    ros-noetic-visualization-msgs
)
depends=(
    ${ros_depends[@]}
    assimp
    boost
    eigen
    console-bridge
    qhull
)

_dir="geometric_shapes-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-planning/geometric_shapes/archive/${pkgver}.tar.gz")
sha256sums=('542028d17daa1e307eb14e9f81c9a75bce64428d31c10ab4d977cdbc70bcea01')

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
