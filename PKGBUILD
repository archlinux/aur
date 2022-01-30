pkgdesc="ROS - The turtlebot3_slam package provides roslaunch scripts for
starting the SLAM"
url='https://wiki.ros.org/turtlebot3_slam'

pkgname='ros-noetic-turtlebot3-slam'
pkgver='1.2.5'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('Apache-2.0')

ros_makedepends=(
	ros-noetic-catkin
)

makedepends=(
	cmake
	ros-build-tools
	${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-roscpp
    ros-noetic-sensor-msgs
    ros-noetic-turtlebot3-bringup
)

depends=(
	${ros_depends[@]}
)

_dir="turtlebot3-${pkgver}/turtlebot3_slam"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ROBOTIS-GIT/turtlebot3/archive/${pkgver}.tar.gz")
sha256sums=('cee1be2249f18084075e4604b70463eb40a96d6f5c2e63efc7f2c501399dee3d')

build() {
	# Use ROS environment variables.
	source /usr/share/ros-build-tools/clear-ros-env.sh
	[ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

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
