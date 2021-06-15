pkgdesc="ROS - A WebSocket interface to rosbridge."
url='https://wiki.ros.org/rosbridge_server'

pkgname='ros-noetic-rosbridge-server'
pkgver='0.11.13'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
    ros-noetic-catkin
)

makedepends=(
    cmake
    ros-build-tools
    ${ros_makedepends[@]}
)

ros_depends=(
    ros-noetic-rosbridge-library
    ros-noetic-rosbridge-msgs
    ros-noetic-rosapi
    ros-noetic-rospy
    ros-noetic-rosauth
)

depends=(
    ${ros_depends[@]}
    python-autobahn
    python-tornado
    python-twisted
)

_dir="rosbridge_suite-${pkgver}/rosbridge_server"
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
