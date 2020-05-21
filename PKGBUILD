pkgdesc="ROS - image_geometry contains C++ and Python libraries for interpreting images geometrically."
url='https://wiki.ros.org/image_geometry'

pkgname='ros-melodic-image-geometry'
pkgver='1.13.0'
arch=('any')
pkgrel='4'
license=('BSD')

ros_makedepends=(
	ros-melodic-sensor-msgs
	ros-melodic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	"${ros_makedepends[@]}"
	'opencv3-opt'
)

ros_depends=(
	ros-melodic-sensor-msgs
)

depends=(
	"${ros_depends[@]}"
	"opencv3-opt"
)

_dir="vision_opencv-${pkgver}/image_geometry"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/vision_opencv/archive/${pkgver}.tar.gz" "use-opencv3.patch")
sha256sums=('c8db35dbb6b470cdedb45195f725bc2cfda7f0dc3155e16a5a37e4b48e29fa59'
            '8937ccf72a7c463e2525cea0c5a3c1ac7f6ac7ea2b3dde79a929c99b57edb02e')

prepare() {
    cd "${srcdir}"
    patch --forward --strip=1  --input=${srcdir}/use-opencv3.patch || return 1
}

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
