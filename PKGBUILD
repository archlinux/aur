pkgdesc="ROS - camera_calibration_parsers contains routines for reading and writing camera calibration parameters."
url='https://wiki.ros.org/camera_calibration_parsers'

pkgname='ros-melodic-camera-calibration-parsers'
pkgver='1.11.13'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=9
license=('BSD')

ros_makedepends=(
	ros-melodic-catkin
	ros-melodic-rosconsole
	ros-melodic-roscpp
	ros-melodic-roscpp-serialization
	ros-melodic-sensor-msgs
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	yaml-cpp
	boost1.69
	boost1.69-libs
	pkg-config
)

ros_depends=(
	ros-melodic-sensor-msgs
	ros-melodic-roscpp
	ros-melodic-roscpp-serialization
)

depends=(
	${ros_depends[@]}
	boost1.69
	boost1.69-libs
	yaml-cpp
)

_dir="image_common-${pkgver}/camera_calibration_parsers"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/image_common/archive/${pkgver}.tar.gz")
sha256sums=('32a2e07724dec6eaaace21eae006274436d70d40bfe205249438570275c43cac')

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
		-DSETUPTOOLS_DEB_LAYOUT=OFF \
		-DBOOST_ROOT=/opt/boost1.69 \
		-DBoost_NO_SYSTEM_PATHS=TRUE
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
