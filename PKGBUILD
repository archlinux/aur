pkgdesc="ROS - Low-level build system macros and infrastructure for ROS."
url='https://www.wiki.ros.org/catkin'

pkgname='ros-noetic-catkin'
pkgver='0.8.4'
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
)

makedepends=(
	'cmake'
	${ros_makedepends[@]}
	python-catkin_pkg
	python-empy
	python
)

ros_depends=(
)

depends=(
	${ros_depends[@]}
	python-nose
	gtest
	python-catkin_pkg
	python-empy
	gmock
	python
	ros-build-tools-py3
)

_dir="catkin-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/catkin/archive/${pkgver}.tar.gz")
sha256sums=('bcb1c06c71c38506aaab891de65a290452cddb872be3928e460e11fd9385c556')

build() {
	# Use ROS environment variables.
	source /usr/share/ros-build-tools/clear-ros-env.sh
	[ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

	# Create the build directory.
	[ -d ${srcdir}/build ] || mkdir ${srcdir}/build
	cd ${srcdir}/build

	# Build the project.
	cmake ${srcdir}/${_dir} \
		-DCATKIN_BUILD_BINARY_PACKAGE=OFF \
		-DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
		-DPYTHON_EXECUTABLE=/usr/bin/python \
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
