pkgdesc="ROS - This package provides four TurtleBot3 basic example include move
using interactive marker, move and stop using LDS, move to goal position, move
to custom routes."
url='https://wiki.ros.org/turtlebot3_example'

pkgname='ros-melodic-turtlebot3-example'
pkgver='1.2.2'
arch=('any')
pkgrel=1
license=('Apache-2.0')

ros_makedepends=(
	ros-melodic-catkin
	ros-melodic-message-generation
	ros-melodic-message-runtime
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
    ros-melodic-rospy
    ros-melodic-actionlib
    ros-melodic-interactive-markers
    ros-melodic-std-msgs
    ros-melodic-sensor-msgs
    ros-melodic-geometry-msgs
    ros-melodic-nav-msgs
    ros-melodic-visualization-msgs
    ros-melodic-actionlib-msgs
    ros-melodic-turtlebot3-msgs
    ros-melodic-message-runtime
    ros-melodic-turtlebot3-bringup
)

depends=(
	${ros_depends[@]}
)

_dir="turtlebot3-${pkgver}/turtlebot3_example"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ROBOTIS-GIT/turtlebot3/archive/${pkgver}.tar.gz")
sha256sums=('c652438109ea99008f6d2e950e6cb7f6e67653b8daa1079c825b77d9f52a4e1d')

build() {
	# Use ROS environment variables.
	source /usr/share/ros-build-tools/clear-ros-env.sh
	[ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

	# Create the build directory.
	[ -d ${srcdir}/build ] || mkdir ${srcdir}/build
	cd ${srcdir}/build

	# Fix Python2/Python3 conflicts.
	/usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

	# Build the project.
	cmake ${srcdir}/${_dir} \
		-DCMAKE_BUILD_TYPE=Release \
		-DCATKIN_BUILD_BINARY_PACKAGE=ON \
		-DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
		-DPYTHON_EXECUTABLE=/usr/bin/python3 \
		-DPYTHON_INCLUDE_DIR=/usr/include/python3.7m \
		-DPYTHON_LIBRARY=/usr/lib/libpython3.7m.so \
		-DPYTHON_BASENAME=.cpython-37m \
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
