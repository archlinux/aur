pkgdesc="ROS - ROS console output library."
url='https://wiki.ros.org/rosconsole'

pkgname='ros-noetic-rosconsole'
pkgver='1.14.3'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(
    ros-noetic-rostime
    ros-noetic-cpp-common
    ros-noetic-rosunit
    ros-noetic-catkin
)

makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
    google-glog
    boost
)

ros_depends=(
    ros-noetic-rostime
    ros-noetic-cpp-common
    ros-noetic-rosbuild
)

depends=(
    ${ros_depends[@]}
    apr
    apr-util
)

_dir="rosconsole-${pkgver}/"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/rosconsole/archive/${pkgver}.tar.gz")
sha256sums=('0b2cbc4f9a92466c0fbae7863482b286ef87692de4941527cb429e6c74639246')

build() {
    # Use ROS environment variables.
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

    # Create the build directory.
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    # Build the project.
    cmake ${srcdir}/${_dir} \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python \
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
        -DROSCONSOLE_BACKEND=glog #log4cxx/glog/print, log4cxx 0.12.0 still broken
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}
