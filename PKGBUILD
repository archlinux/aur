# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Robot-independent Gazebo plugins for sensors, motors and dynamic reconfigurable components."
url='http://gazebosim.org/wiki/Tutorials'

pkgname='ros-indigo-gazebo-plugins'
pkgver='2.4.3'
_pkgver_patch=1
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-indigo-geometry-msgs
  ros-indigo-rospy
  ros-indigo-nav-msgs
  ros-indigo-roscpp
  ros-indigo-cv-bridge
  ros-indigo-message-generation
  ros-indigo-rosconsole
  ros-indigo-sensor-msgs
  ros-indigo-rosgraph-msgs
  ros-indigo-urdf
  ros-indigo-diagnostic-updater
  ros-indigo-std-srvs
  ros-indigo-angles
  ros-indigo-polled-camera
  ros-indigo-tf
  ros-indigo-nodelet
  ros-indigo-trajectory-msgs
  ros-indigo-gazebo-msgs
  ros-indigo-catkin
  ros-indigo-image-transport
  ros-indigo-pcl-conversions
  ros-indigo-dynamic-reconfigure
  ros-indigo-driver-base)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  gazebo
  ogre-1.8
  cegui-0.7-ogre)

ros_depends=(ros-indigo-geometry-msgs
  ros-indigo-rospy
  ros-indigo-nav-msgs
  ros-indigo-roscpp
  ros-indigo-cv-bridge
  ros-indigo-message-generation
  ros-indigo-rosconsole
  ros-indigo-sensor-msgs
  ros-indigo-rosgraph-msgs
  ros-indigo-urdf
  ros-indigo-gazebo-ros
  ros-indigo-std-srvs
  ros-indigo-angles
  ros-indigo-polled-camera
  ros-indigo-tf
  ros-indigo-nodelet
  ros-indigo-trajectory-msgs
  ros-indigo-gazebo-msgs
  ros-indigo-image-transport
  ros-indigo-pcl-conversions
  ros-indigo-dynamic-reconfigure
  ros-indigo-driver-base)
depends=(${ros_depends[@]}
  gazebo
  ogre-1.8)

_tag=release/indigo/gazebo_plugins/${pkgver}-${_pkgver_patch}
_dir=gazebo_plugins
source=("${_dir}"::"git+https://github.com/ros-gbp/gazebo_ros_pkgs-release.git"#tag=${_tag}
        "ogre_linker.patch")
md5sums=('SKIP'
         '995e16e3e777e9a4542d77654ecb1a54')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/indigo/setup.bash ] && source /opt/ros/indigo/setup.bash

  # Apply patch
  msg "Patching source code"
  cd ${srcdir}/${_dir}
  git apply ${srcdir}/ogre_linker.patch

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Adapt paths for Ogre 1.8
  export PKG_CONFIG_PATH="/opt/OGRE-1.8/lib/pkgconfig:$PKG_CONFIG_PATH"
  export LD_LIBRARY_PATH="/opt/OGRE-1.8/lib:$LD_LIBRARY_PATH"

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/indigo \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DSETUPTOOLS_DEB_LAYOUT=OFF \
        -DCMAKE_LIBRARY_PATH="/opt/OGRE-1.8/lib"
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
