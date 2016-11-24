# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - A hub acts as a shared key-value store for multiple ros systems (primarily used by gateways)."
url='http://ros.org/wiki/rocon_hub'

pkgname='ros-indigo-rocon-hub'
pkgver='0.7.10'
_pkgver_patch=1
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-indigo-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-indigo-rosgraph
  ros-indigo-rocon-gateway
  ros-indigo-std-srvs
  ros-indigo-rocon-semantic-version
  ros-indigo-rocon-console
  ros-indigo-rocon-python-redis
  ros-indigo-rocon-python-comms)
depends=(${ros_depends[@]}
  avahi
  redis)

# Git version (e.g. for debugging)
# _tag=release/indigo/rocon_hub/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/yujinrobot-release/rocon_multimaster-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rocon_multimaster-release-release-indigo-rocon_hub-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/yujinrobot-release/rocon_multimaster-release/archive/release/indigo/rocon_hub/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('0a5e300b338d26ebd9787df5e6e1d71e88cb9f1a0222621f98e07c78fbd38fd9')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/indigo \
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
