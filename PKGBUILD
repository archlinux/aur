# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Low-level build system macros and infrastructure for ROS."
url='http://www.ros.org/wiki/catkin'

pkgname='ros-melodic-catkin'
pkgver='0.7.14'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	python-catkin_pkg
	python-empy
	python
)

ros_depends=(
)

depends=(
	${ros_depends[@]}
	python-empy
	python
	python-nose
	python-catkin_pkg
	gmock
	gtest
)

_dir=${pkgname}
source=("${_dir}"::"git+https://github.com/ros-gbp/catkin-release.git")
sha256sums=('SKIP')

prepare() {
	cd ${srcdir}/${_dir}
	git checkout upstream
	_pkgname=$(echo ${pkgname} | sed 's/ros-lunar-//' | sed 's/-/_/g')

	if [ -d ${_pkgname} ]; then
		git subtree split -P ${_pkgname} --branch ${_pkgname}
		git checkout ${_pkgname}
	fi
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
		-DCATKIN_BUILD_BINARY_PACKAGE=OFF \
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
