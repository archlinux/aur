# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Mesh Conversion Utility Used to generate .iv files from .stl files."
url='https://sourceforge.net/projects/ivcon/'

pkgname='ros-noetic-ivcon'
pkgver='0.1.7'
arch=('any')
pkgrel=2
license=('GPL')

ros_makedepends=(ros-noetic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=()
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/noetic/ivcon/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/ivcon-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ivcon-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/ivcon/archive/${pkgver}.tar.gz")
sha256sums=('55b50a0ea6886f031b1b84f3d670e409261821bf10e7ccd315c1c057533ff643')

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
