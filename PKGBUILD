# Maintainer: DanielNak <daniel@tee.cat>

# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks

pkgname='ros-melodic-ecl-console'
pkgver='0.61.6'
_pkgver_patch=0
pkgdesc="ROS - Color codes for ansii consoles."
url='http://wiki.ros.org/ecl_console'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
  ros-melodic-ecl-license
  ros-melodic-catkin
  ros-melodic-ecl-config
  ros-melodic-ecl-build
)
makedepends=(
  'cmake'
  'git'
  'ros-build-tools'
  ${ros_makedepends[@]}
)

ros_depends=(
  ros-melodic-ecl-license
  ros-melodic-ecl-config
  ros-melodic-ecl-build
)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/ecl_console/${pkgver}-${_pkgver_patch}
# _dir=ecl_console
# source=("${_dir}"::"git+https://github.com/yujinrobot-release/ecl_lite-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ecl_lite-release-release-melodic-ecl_console-${pkgver}-${_pkgver_patch}"
source=("https://github.com/yujinrobot-release/ecl_lite-release/archive/release/melodic/ecl_console/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('5586ad3bb23b745e301fb78ddc22ae1125f5b0c559d93e39b9c832ca2307557b')

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
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.9 \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.9.so \
        -DPYTHON_BASENAME=-python3.9 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
