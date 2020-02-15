pkgdesc="ROS - The turtlebot3_slam package provides roslaunch scripts for
starting the SLAM"
url='https://wiki.ros.org/turtlebot3_slam'

pkgname='ros-melodic-turtlebot3-slam'
pkgver='1.2.2'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
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
    ros-melodic-sensor-msgs
    ros-melodic-turtlebot3-bringup
)

depends=(
	${ros_depends[@]}
)

_dir="turtlebot3-${pkgver}/turtlebot3_slam"
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
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
