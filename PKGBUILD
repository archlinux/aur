pkgdesc="ROS - Package for TurtleBot3 fake node. With this package, simple tests
can be done without a robot. You can do simple tests using this package on rviz
without real robots."
url='https://wiki.ros.org/turtlebot3_fake'

pkgname='ros-noetic-turtlebot3-fake'
pkgver='1.2.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('Apache-2.0')

ros_makedepends=(
	ros-noetic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-roscpp
    ros-noetic-std-msgs
    ros-noetic-sensor-msgs
    ros-noetic-geometry-msgs
    ros-noetic-nav-msgs
    ros-noetic-tf
    ros-noetic-turtlebot3-msgs
    ros-noetic-robot-state-publisher
)

depends=(
	${ros_depends[@]}
)

_dir="turtlebot3_simulations-${pkgver}/turtlebot3_fake"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ROBOTIS-GIT/turtlebot3_simulations/archive/${pkgver}.tar.gz")
sha256sums=('6fbb4cf74b9777c3be3a751dd8d638df2570dd4478681b5eadf51dee32f57c5b')

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
