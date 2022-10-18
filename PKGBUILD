# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - ROS console output library."
url='https://wiki.ros.org/rosconsole'

pkgname='ros-melodic-rosconsole'
pkgver='1.13.18'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=5
license=('BSD')

ros_makedepends=(
	ros-melodic-rostime
	ros-melodic-cpp-common
	ros-melodic-rosunit
	ros-melodic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	log4cxx
	apr
	boost1.69
	apr-util
)

ros_depends=(
	ros-melodic-rostime
	ros-melodic-cpp-common
	ros-melodic-rosbuild
)

depends=(
	${ros_depends[@]}
	log4cxx
	apr
	apr-util
)

_dir="rosconsole-${pkgver}/"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/rosconsole/archive/${pkgver}.tar.gz"
  "log4cxx0.13.patch")
sha256sums=('234d83dfddcf864e5d223eaedd58e1505ad0d2707ea4ff497b69c4f28501f179'
  'fd9fb611f66f99285da67ef027bac04e9691a404016957b64b32dc79111deef1')
prepare() {
  cd "${srcdir}/$_dir"
  patch -p1 --input="${srcdir}/log4cxx0.13.patch"
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
		-DSETUPTOOLS_DEB_LAYOUT=OFF \
		 -DBOOST_ROOT=/opt/boost1.69 \
		 -DBoost_NO_SYSTEM_PATHS=TRUE
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
