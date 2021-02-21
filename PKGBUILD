# Maintainer: ftsell <aur@finn-thorben.me>
pkgname='ros-melodic-ros-type-introspection'
pkgdesc='Deserialize ROS messages that are unknown at compilation time'
pkgver='2.1.0'
pkgrel=2
_gitorg=facontidavide
_gitname=ros_type_introspection
#_gitbranch=master
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
url='http://www.ros.org/wiki/ros_type_introspection'
license=('MIT')

ros_makedepends=(
  ros-melodic-roscpp
  ros-melodic-roscpp-serialization
  ros-melodic-rostime)
makedepends=('cmake' 'ros-build-tools' ${ros_makedepends[@]})

ros_depends=(
  ros-melodic-roscpp
  ros-melodic-roscpp-serialization
  ros-melodic-rostime)
depends=(${ros_depends[@]})

_dir="ros_type_introspection-${pkgver}/"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/facontidavide/ros_type_introspection/archive/${pkgver}.tar.gz")
sha256sums=('d46f38719012142992b7e946adcb64ea5d35a747f733fe3388e0d406e50fbdc9')


build() {
    # Use ROS environment variables
    source /usr/share/ros-build-tools/clear-ros-env.sh
    [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

    # Create build directory
    [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
    cd ${srcdir}/build

    # Fix Python2/Python3 conflicts
    /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

    # Build project
    cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
		 -DBOOST_ROOT=/opt/boost1.69 \
		 -DBoost_NO_SYSTEM_PATHS=TRUE
    make
}


package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}

