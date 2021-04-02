# Maintainer : okasha
pkgdesc="ROS - RTAB-Maps ros-pkg."
url='http://www.ros.org/'

pkgname='ros-melodic-rtabmap-ros'
pkgver='0.20.9'
_pkgver_patch=1
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-melodic-genmsg
  ros-melodic-class-loader
  ros-melodic-rtabmap
  ros-melodic-sensor-msgs
  ros-melodic-catkin
  ros-melodic-stereo-msgs
  ros-melodic-visualization-msgs
  ros-melodic-cv-bridge
  ros-melodic-nodelet
  ros-melodic-geometry-msgs
  ros-melodic-std-msgs
  ros-melodic-dynamic-reconfigure
  ros-melodic-image-geometry
  ros-melodic-std-srvs
  ros-melodic-eigen-conversions
  ros-melodic-nav-msgs
  ros-melodic-tf
  ros-melodic-rospy
  ros-melodic-octomap-ros
  ros-melodic-costmap-2d
  ros-melodic-image-transport
  ros-melodic-tf2-ros
  ros-melodic-message-filters
  ros-melodic-move-base-msgs
  ros-melodic-pcl-ros
  ros-melodic-roscpp
  ros-melodic-pcl-conversions
  ros-melodic-rviz
  ros-melodic-tf-conversions
  ros-melodic-laser-geometry)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]}
  pcl)

ros_depends=(ros-melodic-class-loader
  ros-melodic-rtabmap
  ros-melodic-sensor-msgs
  ros-melodic-stereo-msgs
  ros-melodic-visualization-msgs
  ros-melodic-cv-bridge
  ros-melodic-nodelet
  ros-melodic-geometry-msgs
  ros-melodic-std-msgs
  ros-melodic-dynamic-reconfigure
  ros-melodic-image-geometry
  ros-melodic-std-srvs
  ros-melodic-eigen-conversions
  ros-melodic-nav-msgs
  ros-melodic-image-transport-plugins
  ros-melodic-tf
  ros-melodic-rospy
  ros-melodic-octomap-ros
  ros-melodic-costmap-2d
  ros-melodic-image-transport
  ros-melodic-tf2-ros
  ros-melodic-message-filters
  ros-melodic-move-base-msgs
  ros-melodic-pcl-ros
  ros-melodic-roscpp
  ros-melodic-pcl-conversions
  ros-melodic-rviz
  ros-melodic-tf-conversions
  ros-melodic-laser-geometry)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/melodic/rtabmap_ros/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/introlab/rtabmap_ros-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="rtabmap_ros-${pkgver}/"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/introlab/rtabmap_ros/archive/${pkgver}.tar.gz")
sha256sums=('e848336db0e5c98be4c0e903b72ea1b3aa797ee6b83db68f884a11ceb57151c2')

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
