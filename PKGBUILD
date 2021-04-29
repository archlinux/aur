pkgdesc="ROS - roscpp is a C++ implementation of ROS."
url='https://github.com/ros/ros_comm'

pkgname='ros-melodic-roscpp'
pkgver='1.14.11'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD')

ros_makedepends=(
	ros-melodic-xmlrpcpp
	ros-melodic-roscpp-traits
	ros-melodic-catkin
	ros-melodic-rosgraph-msgs
	ros-melodic-message-generation
	ros-melodic-cpp-common
	ros-melodic-std-msgs
	ros-melodic-rosconsole
	ros-melodic-roscpp-serialization
	ros-melodic-rostime
	ros-melodic-roslang
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	pkg-config
)

ros_depends=(
	ros-melodic-rostime
	ros-melodic-xmlrpcpp
	ros-melodic-roscpp-traits
	ros-melodic-rosgraph-msgs
	ros-melodic-cpp-common
	ros-melodic-std-msgs
	ros-melodic-rosconsole
	ros-melodic-roscpp-serialization
	ros-melodic-message-runtime
)

depends=(
	${ros_depends[@]}
)

conflicts=(
	'ros-melodic-roscpp-git'
)

_dir="ros_comm-${pkgver}/clients/roscpp"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/ros_comm/archive/${pkgver}.tar.gz")
sha256sums=('a7f3cf19059c189d3326d3e35f5795d707fa405fb55e7250353d71e0698410f5')

prepare() {
  cd "${srcdir}/${_dir}"
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
