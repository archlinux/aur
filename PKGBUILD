pkgdesc="ROS - Provides service calls for getting ros meta-information, like
list of topics, services, params, etc. "
url='https://wiki.ros.org/rosapi'

pkgname='ros-noetic-rosapi'
pkgver='0.11.13'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-noetic-catkin
    ros-noetic-message-generation
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-rosbridge-library
    ros-noetic-rospy
    ros-noetic-rosnode
    ros-noetic-rosgraph
    ros-noetic-message-runtime
)

depends=(
	${ros_depends[@]}
)

_dir="rosbridge_suite-${pkgver}/rosapi"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/RobotWebTools/rosbridge_suite/archive/${pkgver}.tar.gz")
sha256sums=('e4989b48efce2f101aca6761102b0f9618ecc31a590039b641b35a08fc91d6db')

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
