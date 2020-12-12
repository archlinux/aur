pkgdesc="ROS - ROS packaging system."
url='https://www.wiki.ros.org/ROS'

pkgname='ros-melodic-ros'
pkgver='1.14.9'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(
	ros-melodic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-melodic-rosmake
	ros-melodic-rosboost-cfg
	ros-melodic-rosbuild
	ros-melodic-rosclean
	ros-melodic-rosbash
	ros-melodic-catkin
	ros-melodic-rosunit
	ros-melodic-mk
	ros-melodic-roscreate
	ros-melodic-roslang
	ros-melodic-roslib
)

depends=(
	${ros_depends[@]}
)

_dir="ros-${pkgver}/ros"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/ros/archive/${pkgver}.tar.gz")
sha256sums=('5a129ce35c906f93117f62688a4d24aee1976b7d3f2fdf3dc4f6f305d170fb02')

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
