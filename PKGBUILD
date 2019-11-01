pkgdesc="ROS - Gazebo simulation package for the TurtleBot3"
url='https://wiki.ros.org/turtlebot3_gazebo'

pkgname='ros-melodic-turtlebot3-gazebo'
pkgver='1.2.0'
arch=('any')
pkgrel=1
license=('Apache-2.0')

ros_makedepends=(
	ros-melodic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-roscpp
	ros-melodic-std-msgs
	ros-melodic-sensor-msgs
	ros-melodic-geometry-msgs
	ros-melodic-nav-msgs
	ros-melodic-tf
    ros-melodic-gazebo-ros
)

depends=(
    'gazebo'
	${ros_depends[@]}
)

_dir="turtlebot3_simulations-${pkgver}/turtlebot3_gazebo"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ROBOTIS-GIT/turtlebot3_simulations/archive/${pkgver}.tar.gz")
sha256sums=('6fbb4cf74b9777c3be3a751dd8d638df2570dd4478681b5eadf51dee32f57c5b')

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
