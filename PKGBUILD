# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Provides a portable set of time functions that are especially useful for porting other code or being wrapped by higher level c++ classes."
url='https://wiki.ros.org/ecl_time_lite'

pkgname='ros-melodic-ecl-time-lite'
pkgver='0.61.6'
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-melodic-ecl-license
  ros-melodic-ecl-errors
  ros-melodic-ecl-config
  ros-melodic-ecl-build
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-ecl-license
  ros-melodic-ecl-errors
  ros-melodic-ecl-config
  ros-melodic-ecl-build)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/ecl_time_lite/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/yujinrobot-release/ecl_lite-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ecl_lite-${pkgver}/ecl_time_lite"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/stonier/ecl_lite/archive/${pkgver}.tar.gz")
sha256sums=('b8a02aabecc9a47bde44c83c7e02669e7ce9a3e43f51315b89d10960ed83f3cc')

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
        -DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
        -DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
        -DPYTHON_BASENAME=-python3.7m \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
