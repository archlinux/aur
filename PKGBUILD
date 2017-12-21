# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Common rviz API, used by rviz plugins and applications."
url='http://ros.org/wiki/rviz_common'

pkgname='ros-ardent-rviz-common'
pkgver='2.0.0'
_pkgver_patch=5
arch=('any')
pkgrel=6
license=('BSD')

ros_makedepends=(ros-ardent-ament-cmake)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-tinyxml-vendor
  ros-ardent-std-msgs
  ros-ardent-pluginlib
  ros-ardent-rviz-yaml-cpp-vendor
  ros-ardent-rviz-rendering
  ros-ardent-sensor-msgs
  ros-ardent-rclcpp
  ros-ardent-tf2-geometry-msgs
  ros-ardent-tf2-ros
  ros-ardent-urdf
  ros-ardent-rviz-assimp-vendor
  ros-ardent-resource-retriever
  ros-ardent-tf2
  ros-ardent-geometry-msgs)
depends=(${ros_depends[@]}
  qt5-base)

# Git version (e.g. for debugging)
# _tag=release/ardent/rviz_common/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/rviz-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rviz-release-release-ardent-rviz_common-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/rviz-release/archive/release/ardent/rviz_common/${pkgver}-${_pkgver_patch}.tar.gz" "break_fix.patch" "compiler_flag_fix.patch")
sha256sums=('0cd5a7dc61ee7f8a70e685d657de969222f015c21454260ba14211f79cd2adb4' "b963257bc10323d4ae3a7ec21ea16e6b710c9bcb9b9fce86676ee90f4e5fee15" "0ae7d1d356613cbb691c3cb71b65506e63837d81da88551bcef3bc26a92e40f5")

prepare() {
  cd "${srcdir}"
  patch -Np1 -i "break_fix.patch"
  patch -Np1 -i "compiler_flag_fix.patch"
}

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/ardent/setup.bash ] && source /opt/ros/ardent/setup.bash

  # Create build directory
  [ -d "${srcdir}/build" ] || mkdir "${srcdir}/build"
  cd "${srcdir}/build"

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 "${srcdir}/${_dir}"

  export PYTHONPATH=/opt/ros/ardent/lib/python3.6/site-packages
  export AMENT_PREFIX_PATH=/opt/ros/ardent

  # Build project
  cmake "${srcdir}/${_dir}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_TESTING=Off \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/ardent
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
