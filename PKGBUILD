# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Maintains the ecl licenses and also provides an install target for deploying licenses with the ecl libraries."
url='https://wiki.ros.org/ecl_license'

pkgname='ros-noetic-ecl-license'
pkgver='0.61.8'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=()
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/noetic/ecl_license/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/yujinrobot-release/ecl_tools-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ecl_tools-${pkgver}/ecl_license"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/stonier/ecl_tools/archive/${pkgver}.tar.gz")
sha256sums=('3c7f16efaae81db62dd482b35c60b25bfaa5fed52112347ecaf97a8d10b445f6')

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
