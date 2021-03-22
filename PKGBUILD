# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgdesc="ROS - rosparam wrapper with improved error checking."
url='https://github.com/PickNikRobotics/rosparam_shortcuts'

pkgname='ros-melodic-rosparam-shortcuts'
pkgver='0.4.0'
arch=('x86_64')
pkgrel=4
license=('unknown')

_ros_makedepends=(
  ros-melodic-catkin
  ros-melodic-cmake-modules
  ros-melodic-eigen-conversions
  ros-melodic-roslint
  ros-melodic-roscpp
)

makedepends=(
	'cmake'
	'ros-build-tools'
        eigen
	${_ros_makedepends[@]}
)

_ros_depends=(
  ros-melodic-eigen-conversions
  ros-melodic-roscpp
)

depends=(
	${_ros_depends[@]}
)

_dir="rosparam_shortcuts-${pkgver}/"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/PickNikRobotics/rosparam_shortcuts/archive/${pkgver}.tar.gz")
sha256sums=('b858eb37e6fe31df8e58b80ce1ebbf42a7e3d1a68a9fd49fb51866a8d008d887')

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
