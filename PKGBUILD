# Maintainer : okasha
pkgdesc="ROS - RTAB-Maps standalone library."
url='http://introlab.github.io/rtabmap'

pkgname='ros-melodic-rtabmap'
pkgver='0.20.9'
_pkgver_patch=1
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-melodic-octomap
  ros-melodic-qt-gui-cpp
  ros-melodic-cv-bridge)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  sqlite
  vtk
  qt5-x11extras
  zlib
  proj
  pcl
  gtk3
)

ros_depends=(ros-melodic-octomap
  ros-melodic-qt-gui-cpp
  ros-melodic-cv-bridge)
depends=(${ros_depends[@]}
  sqlite
  vtk
  qt5-x11extras
  zlib
  pcl
  gtk3
  )

# Git version (e.g. for debugging)
# _tag=release/melodic/rtabmap/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/introlab/rtabmap-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rtabmap-${pkgver}-melodic/"
#_dir="rtabmap-release-release-melodic-rtabmap"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/introlab/rtabmap/archive/${pkgver}-melodic.tar.gz")
sha256sums=('5719445a8d94ae3d378db6cb77081ca9e3a60fbda77a5092a7cb8bc09bf0e4a3')


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
        -DPYTHON_LIBRARY=/usr/lib/libpython3.so \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
