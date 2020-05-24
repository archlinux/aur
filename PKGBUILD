pkgdesc="ROS - Rosbridge provides a JSON API to ROS functionality for non-ROS
programs."
url='https://wiki.ros.org/rosbridge_suite'

pkgname='ros-noetic-rosbridge-suite'
pkgver='0.11.3'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-noetic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-rosbridge-library
    ros-noetic-rosbridge-server
    ros-noetic-rosapi
)

depends=(
	${ros_depends[@]}
)

_dir="rosbridge_suite-${pkgver}/rosbridge_suite"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/RobotWebTools/rosbridge_suite/archive/${pkgver}.tar.gz")
sha256sums=('5020616a6589f81fde0dfcd2835bbf4c43ff57bc39b76aefd5ed8f0916af87a5')

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
