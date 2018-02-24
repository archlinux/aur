# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Robot-independent Gazebo plugins for sensors, motors and dynamic reconfigurable components."
url='http://gazebosim.org/tutorials?cat=connect_ros'

pkgname='ros-lunar-gazebo-plugins'
pkgver='2.7.4'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD, Apache 2.0')

ros_makedepends=(ros-lunar-catkin
  ros-lunar-message-generation)
makedepends=(${ros_makedepends[@]}
  cmake
  ros-build-tools)

ros_depends=(ros-lunar-rospy
  ros-lunar-angles
  ros-lunar-diagnostic-updater
  ros-lunar-dynamic-reconfigure
  ros-lunar-nav-msgs
  ros-lunar-message-runtime
  ros-lunar-camera-info-manager
  ros-lunar-std-srvs
  ros-lunar-roscpp
  ros-lunar-tf
  ros-lunar-rosconsole
  ros-lunar-geometry-msgs
  ros-lunar-tf2-ros
  ros-lunar-sensor-msgs
  ros-lunar-urdf
  ros-lunar-polled-camera
  ros-lunar-std-msgs
  ros-lunar-nodelet
  ros-lunar-image-transport
  ros-lunar-trajectory-msgs
  ros-lunar-rosgraph-msgs
  ros-lunar-gazebo-dev
  ros-lunar-gazebo-msgs
  ros-lunar-cv-bridge)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/lunar/gazebo_plugins/2.7.3-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros-gbp/gazebo_ros_pkgs-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="gazebo_ros_pkgs-release-release-lunar-gazebo_plugins-2.7.3-${_pkgver_patch}"
source=("${pkgname}-2.7.3-${_pkgver_patch}.tar.gz"::"https://github.com/ros-gbp/gazebo_ros_pkgs-release/archive/release/lunar/gazebo_plugins/2.7.3-${_pkgver_patch}.tar.gz" "2.7.4.patch")
sha256sums=('c33ef47c379218e6a9f05691aca9137230ecebe43261863a0731a76252ecbb0d'
            '78c551fd6a19214ccae0830fb34627198707f09ad3461c2a71dd16e2efb8423b')

prepare() {
  cd "${srcdir}"
  patch -Np1 -i "2.7.4.patch"
}

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/lunar/setup.bash ] && source /opt/ros/lunar/setup.bash

  # Create build directory
  [ -d "${srcdir}/build" ] || mkdir "${srcdir}/build"
  cd "${srcdir}/build"

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 "${srcdir}/${_dir}"

  # Build project
  cmake "${srcdir}/${_dir}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/lunar \
        -DCMAKE_PREFIX_PATH=/opt/ros/lunar \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
        -DCATKIN_ENABLE_TESTING=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
