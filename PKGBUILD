# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - These tools inspect and describe your system with macros, types and functions."
url='https://wiki.ros.org/ecl_config'

pkgname='ros-noetic-ecl-config'
pkgver='0.61.6'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-noetic-ecl-license
  ros-noetic-ecl-build
  ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-ecl-license
  ros-noetic-ecl-build)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/noetic/ecl_config/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/yujinrobot-release/ecl_lite-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ecl_lite-${pkgver}/ecl_config"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/stonier/ecl_lite/archive/${pkgver}.tar.gz")
sha256sums=('b8a02aabecc9a47bde44c83c7e02669e7ce9a3e43f51315b89d10960ed83f3cc')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
        -DPYTHON_EXECUTABLE=/usr/bin/python \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
