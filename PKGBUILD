pkgdesc="ROS - Provides teleoperation using keyboard for Turtlebot3."
url='https://wiki.ros.org/turtlebot3_teleop'

pkgname='ros-noetic-turtlebot3-teleop'
pkgver='1.2.2'
arch=('any')
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
    ros-noetic-rospy
	ros-noetic-geometry-msgs
)

depends=(
	${ros_depends[@]}
)

_dir="turtlebot3-${pkgver}/turtlebot3_teleop"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ROBOTIS-GIT/turtlebot3/archive/${pkgver}.tar.gz"
	"python-compatibility.patch"::"https://github.com/ROBOTIS-GIT/turtlebot3/commit/ddca617172a3549a3077682cd2cf7dc377616e01.diff")
sha256sums=('c652438109ea99008f6d2e950e6cb7f6e67653b8daa1079c825b77d9f52a4e1d'
            '67678a5af67a9cc2753235fbc78cc2cb57841b63884b5b35599ea32f382fcc89')

prepare() {
	cd ${srcdir}/turtlebot3-${pkgver}
	patch -p1 --input="${srcdir}/python-compatibility.patch"
}

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
