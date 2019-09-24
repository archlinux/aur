# Maintainer: Firas Zaidan <firas@zaidan.de>
pkgdesc="ROS - A ROS node that simply forwards odometry information."
url='http://wiki.ros.org/fake_localization'

pkgname='ros-kinetic-fake-localization'
pkgver='1.14.2'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-kinetic-rospy
  ros-kinetic-roscpp
  ros-kinetic-geometry-msgs
  ros-kinetic-angles
  ros-kinetic-message-filters
  ros-kinetic-rosconsole
  ros-kinetic-catkin
  ros-kinetic-tf
  ros-kinetic-nav-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-kinetic-roscpp
  ros-kinetic-geometry-msgs
  ros-kinetic-rospy
  ros-kinetic-nav-msgs
  ros-kinetic-rosconsole
  ros-kinetic-tf
  ros-kinetic-message-filters)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/kinetic/fake_localization/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/navigation-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="navigation-release-release-kinetic-fake_localization-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/navigation-release/archive/release/kinetic/fake_localization/${pkgver}-${_pkgver_patch}.tar.gz"
        boost-signals.patch)
sha256sums=('03d6633f9bf6e69a26f672b0e26d5f9d9bd94a9e13a1190a3f9f7b74a1364956'
            '628f535fb481bfbe278af66fdee58511c85db117b4f084a3100e57125a7acfbe')

prepare() {
  cd "${srcdir}/${_dir}"
  patch -i "${srcdir}/boost-signals.patch" # https://bitbucket.org/osrf/gazebo/issues/2577/boost-signals-library-removed-in-boost-169
}

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/kinetic/setup.bash ] && source /opt/ros/kinetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/kinetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
