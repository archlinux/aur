# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - This contains CvBridge, which converts between ROS Image messages and OpenCV images."
url='https://wiki.ros.org/cv_bridge'

pkgname='ros-noetic-cv-bridge'
pkgver='1.13.0'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=5
license=('BSD')

ros_makedepends=(
	ros-noetic-sensor-msgs
	ros-noetic-rosconsole
	ros-noetic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	boost
	python
	python-numpy
	opencv3-opt
)

ros_depends=(
	ros-noetic-sensor-msgs
	ros-noetic-rosconsole
)

depends=(
	${ros_depends[@]}
	boost
	python
	python-numpy
	opencv3-opt
)

_dir="vision_opencv-${pkgver}/cv_bridge"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/vision_opencv/archive/${pkgver}.tar.gz"
  "endian-fix.patch"
  "boost-fix.patch")
sha256sums=('c8db35dbb6b470cdedb45195f725bc2cfda7f0dc3155e16a5a37e4b48e29fa59'
  'bc06dbe12f26015c6bce73b2c95123851415d5662c17ef87267737dd433bb22b'
  '50658e5e213df03fa68c51bb399f541699cd022dac4ca68cfcdc19561bcea087')

prepare() {
  cd "${srcdir}/${_dir}"
  patch -uN src/module.hpp ../../../endian-fix.patch || return 1
  patch -uN CMakeLists.txt ../../../boost-fix.patch || return 1
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
