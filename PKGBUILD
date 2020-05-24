pkgdesc="ROS - image_geometry contains C++ and Python libraries for interpreting images geometrically."
url='https://wiki.ros.org/image_geometry'

pkgname='ros-noetic-image-geometry'
pkgver='1.13.0'
arch=('any')
pkgrel='3'
license=('BSD')

ros_makedepends=(
	ros-noetic-sensor-msgs
	ros-noetic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	"${ros_makedepends[@]}"
	'opencv3-opt'
)

ros_depends=(
	ros-noetic-sensor-msgs
)

depends=(
	"${ros_depends[@]}"
	"opencv3-opt"
)

_dir="vision_opencv-${pkgver}/image_geometry"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/vision_opencv/archive/${pkgver}.tar.gz")
sha256sums=('c8db35dbb6b470cdedb45195f725bc2cfda7f0dc3155e16a5a37e4b48e29fa59')

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
