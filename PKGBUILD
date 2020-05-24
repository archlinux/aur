pkgdesc="ROS - The core rosbridge package, repsonsible for interpreting JSON and
performing the appropriate ROS action, like subscribe, publish, call service,
and interact with params."
url='https://wiki.ros.org/rosbridge_library'

pkgname='ros-noetic-rosbridge-library'
pkgver='0.11.3'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-noetic-catkin
    ros-noetic-std-msgs
    ros-noetic-geometry-msgs
    ros-noetic-message-generation
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
    python-pillow
    python-bson
)

ros_depends=(
    ros-noetic-rospy
    ros-noetic-roscpp
    ros-noetic-rosgraph
    ros-noetic-rosservice
    ros-noetic-rostopic
    ros-noetic-std-msgs
    ros-noetic-geometry-msgs
    ros-noetic-message-runtime
)

depends=(
	${ros_depends[@]}
    python-pillow
    python-bson
)

_dir="rosbridge_suite-${pkgver}/rosbridge_library"
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
