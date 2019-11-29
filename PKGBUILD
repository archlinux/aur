pkgdesc="ROS - Generic joystick teleop for twist robots."
url='https://wiki.ros.org/teleop_twist_joy'

pkgname='ros-melodic-teleop-twist-joy'
pkgver='0.1.3'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-melodic-catkin
    ros-melodic-geometry-msgs
    ros-melodic-joy
    ros-melodic-roscpp
    ros-melodic-roslaunch
    ros-melodic-roslint
    ros-melodic-rostest
    ros-melodic-sensor-msgs
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
    ros-melodic-geometry-msgs
    ros-melodic-joy
    ros-melodic-roscpp
    ros-melodic-sensor-msgs
)

depends=(
    'eigen'
	${ros_depends[@]}
)

_dir="teleop_twist_joy-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-teleop/teleop_twist_joy/archive/${pkgver}.tar.gz")
sha256sums=('4b83d6e52e9334f63182af5cf6ebbfb1c1e38f009f39542d32483479bd9c80d2')

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
