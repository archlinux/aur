# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - rqt_gui_cpp enables GUI plugins to use the C++ client library for ROS."
url='http://ros.org/wiki/rqt_gui_cpp'

pkgname='ros-melodic-rqt-gui-cpp'
pkgver='0.5.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-melodic-catkin
	ros-melodic-roscpp
	ros-melodic-qt-gui-cpp
	ros-melodic-qt-gui
	ros-melodic-nodelet
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	qt5-base
)

ros_depends=(
	ros-melodic-qt-gui-cpp
	ros-melodic-roscpp
	ros-melodic-qt-gui
	ros-melodic-nodelet
)

depends=(
	${ros_depends[@]}
)

_dir=${pkgname}
source=("${_dir}"::"git+https://github.com/ros-gbp/rqt-release.git")
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
