pkgdesc="ROS - Low-level build system macros and infrastructure for ROS."
url='https://www.wiki.ros.org/catkin'

pkgname='ros-melodic-catkin'
pkgver='0.7.29'
epoch=1
arch=('any')
pkgrel=2
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

_dir="catkin-${pkgver}/"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/catkin/archive/${pkgver}.tar.gz")
sha256sums=('8a86803b9081b19d2d37c3d028cc9f7bdfc7122f6204ec7e77ae0cbfda57ff71')

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
		-DCATKIN_BUILD_BINARY_PACKAGE=OFF \
		-DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
		-DPYTHON_EXECUTABLE=/usr/bin/python3 \
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
