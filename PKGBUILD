# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - This package contains the description (mechanical, kinematic, visual, etc.) of the PR2 robot."
url='https://wiki.ros.org/pr2_description'

pkgname='ros-melodic-pr2-description'
pkgver='1.12.4'
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(ros-melodic-ivcon
  ros-melodic-convex-decomposition
  ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-melodic-xacro)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/pr2_description/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/pr2-gbp/pr2_common-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="pr2_common-${pkgver}/pr2_description"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/pr2/pr2_common/archive/${pkgver}.tar.gz")
sha256sums=('135c6947f7511bcb3644fa6c0cf5972c309516895737e83f8eeed2b2d069f009')

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
        -DCATKIN_ENABLE_TESTING=0 \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
        -DPYTHON_EXECUTABLE=/usr/bin/python3 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
