# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - The nodelet package is designed to provide a way to run multiple algorithms in the same process with zero copy transport between algorithms."
url='http://ros.org/wiki/nodelet'

pkgname='ros-melodic-nodelet'
pkgver='1.9.16'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-melodic-pluginlib
	ros-melodic-message-generation
	ros-melodic-catkin
	ros-melodic-cmake-modules
	ros-melodic-bondcpp
	ros-melodic-rosconsole
	ros-melodic-roscpp
	ros-melodic-std-msgs
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	boost
	util-linux
)

ros_depends=(
	ros-melodic-message-runtime
	ros-melodic-pluginlib
	ros-melodic-rospy
	ros-melodic-bondcpp
	ros-melodic-rosconsole
	ros-melodic-roscpp
	ros-melodic-std-msgs
)

depends=(
	${ros_depends[@]}
	boost
	util-linux
)

_dir=${pkgname}
source=("${_dir}"::"git+https://github.com/ros-gbp/nodelet_core-release.git")
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
