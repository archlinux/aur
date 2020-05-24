# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - tf2 is the second generation of the transform library, which lets the user keep track of multiple coordinate frames over time."
url='https://www.wiki.ros.org/tf2'

pkgname='ros-noetic-tf2'
pkgver='0.6.5'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-noetic-rostime
	ros-noetic-tf2-msgs
	ros-noetic-catkin
	ros-noetic-geometry-msgs
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	console-bridge
)

ros_depends=(
	ros-noetic-rostime
	ros-noetic-tf2-msgs
	ros-noetic-geometry-msgs
)

depends=(
	${ros_depends[@]}
	console-bridge
)

_dir="geometry2-${pkgver}/tf2"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/geometry2/archive/${pkgver}.tar.gz"
         CMakeLists-signal.patch)
sha256sums=('9a1268621518fc22afd7b12ef1cf30e6901a57b054535924d1d74fd5d267773a'
            '878047021778a148cac5a2a6f04e8ee45df593f294022db053d42bc7e5692dbd')

prepare() {
  cd "${srcdir}/${_dir}"
  patch -uN CMakeLists.txt "${srcdir}/CMakeLists-signal.patch" || return 1
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
