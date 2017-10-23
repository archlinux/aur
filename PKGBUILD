# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - ROS Package Tool."
url='http://wiki.ros.org/rospack'

pkgname='ros-indigo-rospack'
pkgver='2.4.3'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-indigo-cmake-modules
  ros-indigo-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  gtest
  pkg-config
  boost
  tinyxml
  python2)

ros_depends=()
depends=(${ros_depends[@]}
  python2-catkin-pkg
  python2-rosdep
  tinyxml
  python2
  boost
  pkg-config)

# Git version (e.g. for debugging)
# _tag=release/indigo/rospack/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/rospack-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rospack-release-release-indigo-rospack"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/rospack-release/archive/release/indigo/rospack/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('e353c62946f3c26f8e30edbb44c5858018cf399509a4c4c26937c323c6384336')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  find "${srcdir}/${_dir}" -name '*.cpp' -exec sed -i 's#<boost/tr1/unordered_map.hpp>#<unordered_map>#g' '{}' ';'
  find "${srcdir}/${_dir}" -name '*.cpp' -exec sed -i 's#<boost/tr1/unordered_set.hpp>#<unordered_set>#g' '{}' ';'
  find "${srcdir}/${_dir}" -name '*.cpp' -exec sed -i 's#tr1::##g' '{}' ';'

  find "${srcdir}/${_dir}" -name '*.h' -exec sed -i 's#<boost/tr1/unordered_map.hpp>#<unordered_map>#g' '{}' ';'
  find "${srcdir}/${_dir}" -name '*.h' -exec sed -i 's#<boost/tr1/unordered_set.hpp>#<unordered_set>#g' '{}' ';'
  find "${srcdir}/${_dir}" -name '*.h' -exec sed -i 's#tr1::##g' '{}' ';'

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
