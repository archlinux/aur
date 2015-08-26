# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - PCL (Point Cloud Library) ROS interface stack."
url='http://ros.org/wiki/perception_pcl'

pkgname='ros-jade-pcl-ros'
pkgver='1.3.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(ros-jade-pcl-msgs
  ros-jade-roslib
  ros-jade-cmake-modules
  ros-jade-dynamic-reconfigure
  ros-jade-std-msgs
  ros-jade-sensor-msgs
  ros-jade-genmsg
  ros-jade-nodelet
  ros-jade-roscpp
  ros-jade-catkin
  ros-jade-tf
  ros-jade-nodelet-topic-tools
  ros-jade-rosbag
  ros-jade-rosconsole
  ros-jade-pluginlib
  ros-jade-pcl-conversions)
makedepends=('cmake' 'git' 'ros-build-tools'
  ${ros_makedepends[@]}
  vtk
  eigen3
  pcl)

ros_depends=(ros-jade-pcl-msgs
  ros-jade-nodelet-topic-tools
  ros-jade-dynamic-reconfigure
  ros-jade-std-msgs
  ros-jade-sensor-msgs
  ros-jade-nodelet
  ros-jade-roscpp
  ros-jade-tf
  ros-jade-message-filters
  ros-jade-rosbag
  ros-jade-pluginlib
  ros-jade-pcl-conversions)
depends=(${ros_depends[@]}
  vtk
  eigen3
  pcl)

_tag=release/jade/pcl_ros/${pkgver}-${_pkgver_patch}
_dir=pcl_ros
source=("${_dir}"::"git+https://github.com/ros-gbp/perception_pcl-release.git"#tag=${_tag}
        "eigen3.patch")
md5sums=('SKIP'
         '88edcccaf4a04f30dd683ca304a90d82')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/jade/setup.bash ] && source /opt/ros/jade/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Apply patch
  git -C ${srcdir}/${_dir} apply ${srcdir}/eigen3.patch

  # Fix Python2/Python3 conflicts
  /usr/share/ros-build-tools/fix-python-scripts.sh -v 2 ${srcdir}/${_dir}

  # Build project
  cmake ${srcdir}/${_dir} \
        -DCMAKE_BUILD_TYPE=Release \
        -DCATKIN_BUILD_BINARY_PACKAGE=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/ros/jade \
        -DPYTHON_EXECUTABLE=/usr/bin/python2 \
        -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
        -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
        -DPYTHON_BASENAME=-python2.7 \
        -DSETUPTOOLS_DEB_LAYOUT=OFF
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}/" install
}
