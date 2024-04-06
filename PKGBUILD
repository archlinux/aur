pkgdesc="ROS - 3D visualization tool for ROS."
url='https://wiki.ros.org/rviz'

pkgname='ros-melodic-rviz'
pkgver=1.13.30.r2.g96a76a40
_commit=96a76a40473bbc78dc29453891500e90e82fc50a
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD, Creative Commons')

ros_makedepends=(
  ros-melodic-std-srvs
  ros-melodic-rosbag
  ros-melodic-tf
  ros-melodic-nav-msgs
  ros-melodic-urdf
  ros-melodic-python-qt-binding
  ros-melodic-resource-retriever
  ros-melodic-laser-geometry
  ros-melodic-std-msgs
  ros-melodic-interactive-markers
  ros-melodic-message-filters
  ros-melodic-rospy
  ros-melodic-roslib
  ros-melodic-image-transport
  ros-melodic-cmake-modules
  ros-melodic-catkin
  ros-melodic-rosconsole
  ros-melodic-roscpp
  ros-melodic-visualization-msgs
  ros-melodic-sensor-msgs
  ros-melodic-map-msgs
  ros-melodic-pluginlib
  ros-melodic-geometry-msgs
)

makedepends=(
  'cmake'
  'ros-build-tools'
  ${ros_makedepends[@]}
  yaml-cpp
  eigen
  ogre-1.9
  assimp
  mesa
  tinyxml2
  urdfdom-headers
  qt5-base
  boost
)

ros_depends=(
  ros-melodic-std-srvs
  ros-melodic-rosbag
  ros-melodic-tf
  ros-melodic-nav-msgs
  ros-melodic-urdf
  ros-melodic-python-qt-binding
  ros-melodic-resource-retriever
  ros-melodic-laser-geometry
  ros-melodic-media-export
  ros-melodic-std-msgs
  ros-melodic-interactive-markers
  ros-melodic-message-filters
  ros-melodic-rospy
  ros-melodic-roslib
  ros-melodic-image-transport
  ros-melodic-rosconsole
  ros-melodic-roscpp
  ros-melodic-visualization-msgs
  ros-melodic-sensor-msgs
  ros-melodic-map-msgs
  ros-melodic-pluginlib
  ros-melodic-geometry-msgs
)

depends=(
  ${ros_depends[@]}
  yaml-cpp
  eigen
  ogre-1.9
  assimp
  mesa
  tinyxml2
  urdfdom-headers
  qt5-base
  sip
  python-pyqt5-sip
  boost-libs
)

_dir="${pkgname}/"
source=("${pkgname}::git+https://github.com/ros-visualization/rviz.git#commit=${_commit}")
b2sums=('SKIP')

pkgver() {
    cd "${_dir}"

    # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
    local _gitversion=$(git describe --long --tags --match '[v0-9][0-9.][0-9.]*' | sed -e 's|^v||' | tr '[:upper:]' '[:lower:]') 

    # Format git-based version for pkgver
    # Expected format: e.g. 1.5.0rc2.r521.g99982a1c
    # Or in case of 'post': 1.5.0.post1.r521.g99982a1c
    echo "${_gitversion}" | sed \
        -e 's;^\([0-9][0-9.]*\)[-_.]\([a-zA-Z]\+\);\1\2;' \
        -e 's;\([0-9]\+-g\);r\1;' \
        -e 's;-;.;g' \
        -e 's;\(post.*\);\.\1;'
}

build() {
  # Use ROS environment variables.
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

  # Fixes OGRE Path issue
  PKG_CONFIG_PATH=/opt/OGRE-1.9/lib/pkgconfig:$PKG_CONFIG_PATH

  # Create the build directory.
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Build the project.
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
