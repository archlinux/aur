pkgdesc="ROS - This ROS package wraps documentation tools like doxygen, sphinx, and epydoc, making it convenient to generate ROS package documentation."
url='http://wiki.ros.org/rosdoc_lite'

pkgname='ros-noetic-rosdoc-lite'
pkgver='0.2.11'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-catkin
)

makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
    python-setuptools
)

ros_depends=(
    ros-noetic-genmsg
)

depends=(
    ${ros_depends[@]}
    graphviz
    epydoc
    python-rospkg
    python-yaml
    doxygen
    python-sphinx
    python-kitchen
    python-catkin_pkg
)

_dir="rosdoc_lite-${pkgver}/"
source=(
    "${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-infrastructure/rosdoc_lite/archive/refs/tags/${pkgver}.tar.gz"
    "fix-python-scripts.sh"
)
sha256sums=(
    '5a987c22435aaf9a5e0b5d3065e5efb431720b890bfedda3965d127686c49aa5'
    '91138936856fad15bc66402db3e2571fb77ef41fe92f7713728410ee484718b6'
)


build() {
    # Use ROS environment variables
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

    # Create build directory
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    # Fix Python2/Python3 conflicts
    $srcdir/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

    # Build project
    cmake ${srcdir}/${_dir} \
            -DCMAKE_BUILD_TYPE=Release \
            -DCATKIN_BUILD_BINARY_PACKAGE=ON \
            -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
            -DPYTHON_EXECUTABLE=/usr/bin/python3 \
            -DPYTHON_INCLUDE_DIR=/usr/include/python3.11 \
            -DPYTHON_LIBRARY=/usr/lib/libpython3.11.so \
            -DPYTHON_BASENAME=.cpython-311 \
            -DSETUPTOOLS_DEB_LAYOUT=OFF
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}
