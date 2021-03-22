# Maintainer: Timon Engelke <aur@timonengelke.de>
pkgdesc="ROS - Convex Decomposition Tool for Robot Model."
url='https://codesuppository.blogspot.com'

pkgname='ros-melodic-convex-decomposition'
pkgver='0.1.12'
arch=('any')
pkgrel=3
license=('MIT')

ros_makedepends=(ros-melodic-catkin)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  unzip)

ros_depends=()
depends=(${ros_depends[@]}
  unzip)

# Git version (e.g. for debugging)
# _tag=release/melodic/convex_decomposition/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/convex_decomposition-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="convex_decomposition-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/convex_decomposition/archive/${pkgver}.tar.gz")
sha256sums=('01621bace11c1929a2ae252a37763fbe7f56d0cfb651105e992505b96d9fdd4a')

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
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}

