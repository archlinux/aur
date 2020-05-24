pkgdesc="ROS - 3D visualization tool for ROS."
url='https://wiki.ros.org/rviz'

pkgname='ros-noetic-rviz'
pkgver='1.13.7'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD, Creative Commons')

ros_makedepends=(
	ros-noetic-std-srvs
	ros-noetic-rosbag
	ros-noetic-tf
	ros-noetic-nav-msgs
	ros-noetic-urdf
	ros-noetic-python-qt-binding
	ros-noetic-resource-retriever
	ros-noetic-laser-geometry
	ros-noetic-std-msgs
	ros-noetic-interactive-markers
	ros-noetic-message-filters
	ros-noetic-rospy
	ros-noetic-roslib
	ros-noetic-image-transport
	ros-noetic-cmake-modules
	ros-noetic-catkin
	ros-noetic-rosconsole
	ros-noetic-roscpp
	ros-noetic-visualization-msgs
	ros-noetic-sensor-msgs
	ros-noetic-map-msgs
	ros-noetic-pluginlib
	ros-noetic-geometry-msgs
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	yaml-cpp
	eigen3
	ogre-1.9
	assimp
	mesa
	tinyxml2
	urdfdom-headers
	qt5-base
)

ros_depends=(
	ros-noetic-std-srvs
	ros-noetic-rosbag
	ros-noetic-tf
	ros-noetic-nav-msgs
	ros-noetic-urdf
	ros-noetic-python-qt-binding
	ros-noetic-resource-retriever
	ros-noetic-laser-geometry
	ros-noetic-media-export
	ros-noetic-std-msgs
	ros-noetic-interactive-markers
	ros-noetic-message-filters
	ros-noetic-rospy
	ros-noetic-roslib
	ros-noetic-image-transport
	ros-noetic-rosconsole
	ros-noetic-roscpp
	ros-noetic-visualization-msgs
	ros-noetic-sensor-msgs
	ros-noetic-map-msgs
	ros-noetic-pluginlib
	ros-noetic-geometry-msgs
)

depends=(
	${ros_depends[@]}
	yaml-cpp
	eigen3
	ogre-1.9
	assimp
	mesa
	tinyxml2
	urdfdom-headers
	qt5-base
	sip
	python-sip
)

_dir="rviz-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-visualization/rviz/archive/${pkgver}.tar.gz")
sha256sums=('d02b797ddddb22844f6d37b19112959774867da95b58ac4a09169747e0c42152')

build() {
	# Use ROS environment variables.
	source /usr/share/ros-build-tools/clear-ros-env.sh
	[ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

	# Fixes OGRE Path issue
	PKG_CONFIG_PATH=/opt/OGRE-1.9/lib/pkgconfig:$PKG_CONFIG_PATH

	# Create the build directory.
	[ -d ${srcdir}/build ] || mkdir ${srcdir}/build
	cd ${srcdir}/build

	# Build the project.
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
