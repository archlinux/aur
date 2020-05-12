pkgdesc="ROS - Package containing message files"
url='https://wiki.ros.org/rosbridge_msgs'

pkgname='ros-melodic-rosbridge-msgs'
pkgver='0.11.6'
arch=('any')
pkgrel=1
license=('BSD')

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
    ros-melodic-message-runtime
    ros-melodic-std-msgs
)

depends=(
	${ros_depends[@]}
)

_dir="rosbridge_suite-${pkgver}/rosbridge_msgs"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/RobotWebTools/rosbridge_suite/archive/${pkgver}.tar.gz")
sha256sums=('ac7a4fc4c3dd8866e90aacf5dafc53b9b0ca9bd6676f141e0ecd9a3b7fc694a6')

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
