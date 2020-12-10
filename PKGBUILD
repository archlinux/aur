# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - A set of message filters which take in messages and may output those messages at a later time, based on the conditions that filter needs met."
url='https://wiki.ros.org/message_filters'

pkgname='ros-melodic-message-filters'
pkgver='1.14.10'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-melodic-rostest
	ros-melodic-rosunit
	ros-melodic-catkin
	ros-melodic-rosconsole
	ros-melodic-roscpp
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	boost1.69
)

ros_depends=(
	ros-melodic-rosconsole
	ros-melodic-roscpp
)

depends=(
	${ros_depends[@]}
)

conflicts=(
	'ros-melodic-message-filters-git'
)

_dir="ros_comm-${pkgver}/utilities/message_filters"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/ros_comm/archive/${pkgver}.tar.gz")
sha256sums=('b3b75612feb447afe70600e3ba80bf3e356493a058ba8ebf2746e8db0c55165c')

build() {
	# Use ROS environment variables.
	source /usr/share/ros-build-tools/clear-ros-env.sh
	[ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

	# Create the build directory.
	[ -d ${srcdir}/build ] || mkdir ${srcdir}/build
	cd ${srcdir}/build

	# Fix Python2/Python3 conflicts.
	/usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}
	#Workaround for boost1.69 signals
        sed -i 's/signals//g' ${srcdir}/${_dir}/CMakeLists.txt

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
