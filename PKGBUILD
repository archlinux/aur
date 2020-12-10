# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - ROS Package Tool."
url='https://wiki.ros.org/rospack'

pkgname='ros-melodic-rospack'
pkgver='2.5.6'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-melodic-cmake-modules
	ros-melodic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	tinyxml2
	gtest
	pkg-config
	boost1.69
	python
)

ros_depends=(
	ros-melodic-ros-environment
)

depends=(
	${ros_depends[@]}
	tinyxml2
	python-rosdep
	python-catkin_pkg
	pkg-config
	boost1.69
	python
)

_dir="rospack-${pkgver}"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/rospack/archive/${pkgver}.tar.gz")
sha256sums=('1161da45bf0e0dea824f01926b07b59307e8eb24158e03e510afee6f7d264f86')

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
		 -DBOOST_ROOT=/opt/boost1.69
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
