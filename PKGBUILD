# For more information: https://github.com/okasha55/rtabmap_aur
pkgdesc="ROS - RTAB-Maps standalone library."
url='http://introlab.github.io/rtabmap'

pkgname='ros-melodic-rtabmap'
pkgver='0.19.3'
_pkgver_patch=1
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-melodic-octomap
  ros-melodic-qt-gui-cpp
  ros-melodic-cv-bridge)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  sqlite
  vtk
  zlib
  proj
  pcl
)

ros_depends=(ros-melodic-octomap
  ros-melodic-qt-gui-cpp
  ros-melodic-cv-bridge)
depends=(${ros_depends[@]}
  sqlite
  vtk
  zlib
  pcl
  )

# Git version (e.g. for debugging)
# _tag=release/melodic/rtabmap/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/introlab/rtabmap-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
#_dir="rtabmap-release-release-melodic-rtabmap-${pkgver}-${_pkgver_patch}"
_dir="rtabmap-release-release-melodic-rtabmap"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/introlab/rtabmap-release/archive/release/melodic/rtabmap/${pkgver}-${_pkgver_patch}.tar.gz"
       "CloudViewer_vtkTexture.patch")
sha256sums=('f17bbf2f41e9e37b99630fc903fdbdb81a2f3b63789c9d58f15d7dcc3eab132d'
            'SKIP')

prepare() {
  cd ${srcdir}/${_dir}/guilib/src
  patch -Np1 --binary -i ${srcdir}/CloudViewer_vtkTexture.patch
}

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
