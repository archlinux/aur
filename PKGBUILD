# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The control toolbox contains modules that are useful across all controllers."
url='https://wiki.ros.org/control_toolbox'

pkgname='ros-melodic-control-toolbox'
pkgver='1.18.2'
_pkgver_patch=0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-melodic-dynamic-reconfigure
  ros-melodic-std-msgs
  ros-melodic-roscpp
  ros-melodic-catkin
  ros-melodic-control-msgs
  ros-melodic-realtime-tools
  ros-melodic-message-generation
  ros-melodic-cmake-modules)
makedepends=('cmake' 'ros-build-tools'
  boost1.69
  ${ros_makedepends[@]}
  tinyxml)

ros_depends=(ros-melodic-dynamic-reconfigure
  ros-melodic-std-msgs
  ros-melodic-message-runtime
  ros-melodic-roscpp
  ros-melodic-control-msgs
  ros-melodic-realtime-tools
  ros-melodic-cmake-modules)
depends=(${ros_depends[@]}
  boost1.69
  tinyxml)

# Git version (e.g. for debugging)
# _tag=release/melodic/control_toolbox/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/control_toolbox-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="control_toolbox-${pkgver}/"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-controls/control_toolbox/archive/${pkgver}.tar.gz")
sha256sums=('064bcde85b251fdb8dff91c121652526e813a9cba3859786cc16e7b8a55e2e79')

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
