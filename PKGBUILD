# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgdesc="ROS - rosparam wrapper with improved error checking."
url='https://github.com/PickNikRobotics/rosparam_shortcuts'

pkgname='ros-melodic-rosparam-shortcuts'
pkgver='0.3.3'
arch=('x86_64')
pkgrel=1
license=('unknown')

_ros_makedepends=(
	ros-melodic-catkin
  ros-melodic-eigen-conversions
  ros-melodic-roslint
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${_ros_makedepends[@]}
)

_ros_depends=(
	ros-melodic-rosparam
  ros-melodic-rosout
)

depends=(
	${_ros_depends[@]}
)

_dir="rosparam_shortcuts-${pkgver}/"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/PickNikRobotics/rosparam_shortcuts/archive/${pkgver}.tar.gz")
sha256sums=('3022ea05b63f57209ceb0fb0df21c7c8747d8af9825949a65e94d9cb7a2ef8cc')

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
