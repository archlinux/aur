# Maintainer: ftsell <aur@finn-thorben.me>
pkgname=ros-melodic-ros-type-introspection
pkgdesc="Deserialize ROS messages that are unknown at compilation time"
pkgver=2.0.4
pkgrel=1
_gitorg=facontidavide
_gitname=ros_type_introspection
#_gitbranch=master
arch=(any)
url="http://www.ros.org/wiki/ros_type_introspection"
license=("MIT")

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools' ${ros_makedepends[@]})

ros_depends=("ros-melodic-roscpp" "ros-melodic-roscpp-serialization" "ros-melodic-rostime")
depends=(${ros_depends[@]})

_dir="${_gitname}-${pkgver}"
source=("${_gitname}.tar.gz::https://github.com/${_gitorg}/${_gitname}/archive/${pkgver}.tar.gz")
sha256sums=("648e7debaacef15ecbb7330851a7c70e2563dace8f7fffd4f1632b7ce2b8c61c")


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
        -DSETUPTOOLS_DEB_LAYOUT=OFF
    make
}


package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
}

